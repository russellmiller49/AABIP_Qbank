import Foundation
import Combine

@MainActor
final class QuizViewModel: ObservableObject {
    enum State: Equatable {
        case idle
        case loading
        case ready
        case completed
        case error(String)
    }

    enum InitialSessionAction {
        case startFresh
        case resumeIfAvailable
    }

    @Published private(set) var state: State = .idle
    @Published private(set) var questions: [QuizSessionQuestion] = []
    @Published private(set) var currentIndex: Int = 0
    @Published private(set) var selections: [String: String] = [:]

    private var questionLookup: [String: QuizSessionQuestion] = [:]
    private var startDate: Date?
    private var endDate: Date?
    private var questionBank: QuestionBankService?
    private var localStore: LocalStoreType?
    private var sessionState: QuizSessionState?
    private var isConfigured = false

    var currentQuestion: QuizSessionQuestion? {
        guard currentIndex >= 0 && currentIndex < questions.count else { return nil }
        return questions[currentIndex]
    }

    var progressText: String {
        guard !questions.isEmpty else { return "" }
        return "Question \(min(currentIndex + 1, questions.count)) of \(questions.count)"
    }

    var score: Int {
        selections.reduce(into: 0) { partialResult, element in
            guard let question = questionLookup[element.key] else { return }
            if question.question.correctOptionId == element.value {
                partialResult += 1
            }
        }
    }

    var duration: TimeInterval {
        guard let startDate else { return 0 }
        return (endDate ?? Date()).timeIntervalSince(startDate)
    }

    func configure(questionBank: QuestionBankService, localStore: LocalStoreType) {
        guard !isConfigured else { return }
        self.questionBank = questionBank
        self.localStore = localStore
        isConfigured = true
    }

    func prepareQuickStart(limit: Int, resumePreference: InitialSessionAction) {
        guard let questionBank, let localStore else { return }
        switch resumePreference {
        case .resumeIfAvailable:
            if let stored = localStore.activeQuizSession(),
               !stored.isCompleted,
               loadSession(from: stored, using: questionBank) {
                return
            }
            fallthrough
        case .startFresh:
            startQuickStart(limit: limit)
        }
    }

    func startQuickStart(limit: Int) {
        guard let questionBank else { return }
        guard state != .loading else { return }
        state = .loading
        let sessionQuestions = questionBank.quickStartQuestions(limit: limit)
        beginNewSession(with: sessionQuestions, limit: nil)
    }

    func startModuleQuiz(moduleID: String, limit: Int) {
        guard let questionBank else { return }
        state = .loading
        var sessionQuestions = questionBank.sessionQuestions(forModule: moduleID)
        guard !sessionQuestions.isEmpty else {
            state = .error("This category is not available yet.")
            return
        }
        sessionQuestions.shuffle()
        beginNewSession(with: sessionQuestions, limit: limit)
    }

    func startIncorrectOnly(limit: Int) {
        guard let questionBank, let localStore else { return }
        state = .loading
        let sessions = localStore.completedQuizSessions()
        var seen = Set<String>()
        var incorrectQuestions: [QuizSessionQuestion] = []

        for session in sessions {
            for reference in session.questionReferences {
                guard let sessionQuestion = questionBank.sessionQuestion(for: reference) else { continue }
                let questionID = sessionQuestion.question.id
                let selected = session.selections[questionID]
                if selected != sessionQuestion.question.correctOptionId, seen.insert(questionID).inserted {
                    incorrectQuestions.append(sessionQuestion)
                }
            }
        }

        guard !incorrectQuestions.isEmpty else {
            state = .error("No incorrect answers yet. Complete a quiz first.")
            return
        }

        incorrectQuestions.shuffle()
        beginNewSession(with: incorrectQuestions, limit: limit)
    }

    func restart(with mode: QuizMode, limit: Int) {
        switch mode {
        case .quickStart:
            startQuickStart(limit: limit)
        case let .module(id, _):
            startModuleQuiz(moduleID: id, limit: limit)
        case .incorrectOnly:
            startIncorrectOnly(limit: limit)
        }
    }

    func select(optionId: String) {
        guard state == .ready, let question = currentQuestion else { return }
        guard !isAnswered(question) else { return }
        var updated = selections
        updated[question.id] = optionId
        selections = updated
        updateSession { session in
            session.selections = updated
        }
    }

    func isOptionSelected(_ optionId: String, for question: QuizSessionQuestion) -> Bool {
        selections[question.id] == optionId
    }

    func isOptionCorrect(_ optionId: String, for question: QuizSessionQuestion) -> Bool {
        question.question.correctOptionId == optionId
    }

    func isAnswered(_ question: QuizSessionQuestion) -> Bool {
        selections[question.id] != nil
    }


    var canGoBack: Bool { currentIndex > 0 }
    var canAdvance: Bool { currentIndex + 1 < questions.count }

    func goBack() {
        guard canGoBack else { return }
        currentIndex -= 1
        updateSession { session in
            session.currentIndex = currentIndex
        }
    }

    func jumpToQuestion(at index: Int) {
        guard index >= 0, index < questions.count else { return }
        currentIndex = index
        updateSession { session in
            session.currentIndex = currentIndex
        }
    }

    func advance() {
        guard state == .ready else { return }
        if currentIndex + 1 < questions.count {
            currentIndex += 1
            updateSession { session in
                session.currentIndex = currentIndex
            }
        } else {
            finishSession()
        }
    }

    func selection(for question: QuizSessionQuestion) -> String? {
        selections[question.id]
    }

    private func beginNewSession(with sessionQuestions: [QuizSessionQuestion], limit: Int?, storeActiveSession: Bool = true) {
        guard !sessionQuestions.isEmpty else {
            state = .error("Question bank is unavailable.")
            return
        }
        var working = sessionQuestions
        if let limit {
            working = Array(working.prefix(max(1, min(limit, working.count))))
        }
        questionLookup = Dictionary(uniqueKeysWithValues: working.map { ($0.question.id, $0) })
        questions = working
        selections = [:]
        currentIndex = 0
        let now = Date()
        startDate = now
        endDate = nil
        let references = working.map { QuizSessionQuestionReference(moduleID: $0.module.id, questionID: $0.question.id) }
        let session = QuizSessionState(
            id: UUID(),
            startedAt: now,
            lastUpdatedAt: now,
            currentIndex: 0,
            questionReferences: references,
            selections: [:]
        )
        sessionState = session
        if storeActiveSession {
            localStore?.saveActiveQuizSession(session)
        }
        state = .ready
    }

    private func updateSession(_ block: (inout QuizSessionState) -> Void) {
        guard var state = sessionState else { return }
        block(&state)
        state.lastUpdatedAt = Date()
        sessionState = state
        localStore?.saveActiveQuizSession(state)
    }

    private func loadSession(from stored: QuizSessionState, using questionBank: QuestionBankService) -> Bool {
        let restoredQuestions: [QuizSessionQuestion] = stored.questionReferences.compactMap { reference in
            questionBank.sessionQuestion(for: reference)
        }

        guard !restoredQuestions.isEmpty, restoredQuestions.count == stored.questionReferences.count else {
            return false
        }

        questionLookup = Dictionary(uniqueKeysWithValues: restoredQuestions.map { ($0.id, $0) })
        questions = restoredQuestions
        selections = stored.selections
        sessionState = stored
        startDate = stored.startedAt
        if stored.isCompleted {
            endDate = stored.lastUpdatedAt
            currentIndex = max(restoredQuestions.count - 1, 0)
            state = .completed
        } else {
            endDate = nil
            let cappedIndex = max(0, min(stored.currentIndex, restoredQuestions.count - 1))
            currentIndex = cappedIndex
            state = .ready
        }
        return true
    }

    private func finishSession() {
        guard let localStore else { return }
        let finishDate = Date()
        updateSession { session in
            session.currentIndex = questions.count
        }
        endDate = finishDate
        state = .completed
        let total = max(questions.count, 1)
        let correct = score
        if var session = sessionState {
            session.lastUpdatedAt = finishDate
            sessionState = session
        }
        if let session = sessionState {
            let completed = CompletedQuizSession(
                id: session.id,
                startedAt: session.startedAt,
                completedAt: finishDate,
                duration: finishDate.timeIntervalSince(session.startedAt),
                totalQuestions: total,
                correctCount: correct,
                questionReferences: session.questionReferences,
                selections: selections
            )
            localStore.addCompletedQuizSession(completed)
        }
    }
}
