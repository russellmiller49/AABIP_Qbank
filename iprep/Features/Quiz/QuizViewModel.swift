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
        self.isConfigured = true
    }

    func prepareInitialSession(limit: Int, resumePreference: InitialSessionAction) {
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

    func startQuickStart(limit: Int = 10) {
        guard let questionBank, let localStore else { return }
        guard state != .loading else { return }
        state = .loading
        let sessionQuestions = questionBank.quickStartQuestions(limit: limit)
        guard !sessionQuestions.isEmpty else {
            state = .error("Question bank is unavailable.")
            return
        }
        questions = sessionQuestions
        questionLookup = Dictionary(uniqueKeysWithValues: sessionQuestions.map { ($0.id, $0) })
        selections = [:]
        currentIndex = 0
        let now = Date()
        startDate = now
        endDate = nil
        let references = sessionQuestions.map { QuizSessionQuestionReference(moduleID: $0.module.id, questionID: $0.question.id) }
        let session = QuizSessionState(
            id: UUID(),
            startedAt: now,
            lastUpdatedAt: now,
            currentIndex: 0,
            questionReferences: references,
            selections: [:]
        )
        sessionState = session
        localStore.saveActiveQuizSession(session)
        state = .ready
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

    func restart(limit: Int = 10) {
        state = .idle
        startQuickStart(limit: limit)
    }

    func selection(for question: QuizSessionQuestion) -> String? {
        selections[question.id]
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
            guard let module = questionBank.quizModule(for: reference.moduleID),
                  let question = module.questions.first(where: { $0.id == reference.questionID }) else {
                return nil
            }
            return QuizSessionQuestion(module: module, question: question)
        }

        guard !restoredQuestions.isEmpty, restoredQuestions.count == stored.questionReferences.count else {
            return false
        }

        questions = restoredQuestions
        questionLookup = Dictionary(uniqueKeysWithValues: restoredQuestions.map { ($0.id, $0) })
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
