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
    @Published private(set) var configuration: QuizSessionConfiguration = .default
    @Published private(set) var questionStates: [String: QuestionStudyState] = [:]
    @Published private(set) var elapsedSeconds: TimeInterval = 0
    @Published private(set) var currentQuestionSeconds: TimeInterval = 0
    @Published private(set) var isTimerPaused: Bool = false

    private var questionLookup: [String: QuizSessionQuestion] = [:]
    private var startDate: Date?
    private var endDate: Date?
    private var questionBank: QuestionBankService?
    private var localStore: LocalStoreType?
    private var sessionState: QuizSessionState?
    private var studyPlanner: StudyPlannerType?
    private var timerCancellable: AnyCancellable?
    private var lastTickDate: Date?
    private var lastQuestionID: String?
    private var lastPersistedElapsed: TimeInterval = 0
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

    func configure(questionBank: QuestionBankService, localStore: LocalStoreType, studyPlanner: StudyPlannerType?) {
        guard !isConfigured else { return }
        self.questionBank = questionBank
        self.localStore = localStore
        self.studyPlanner = studyPlanner
        self.questionStates = localStore.allStudyStates()
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
        let answered = localStore?.answeredQuestionIDs() ?? []
        let sessionQuestions = questionBank.quickStartQuestions(limit: limit, excluding: answered)
        guard !sessionQuestions.isEmpty else {
            state = .error("You're all caught up! Reset progress in Settings to practice again.")
            return
        }
        beginNewSession(with: sessionQuestions, limit: nil)
    }

    func startModuleQuiz(moduleID: String, limit: Int) {
        guard let questionBank else { return }
        state = .loading
        let answered = localStore?.answeredQuestionIDs() ?? []
        var sessionQuestions = questionBank.sessionQuestions(forModule: moduleID, excluding: answered)
        guard !sessionQuestions.isEmpty else {
            state = .error("All questions in this category are complete. Reset progress in Settings to study it again.")
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
        synchronizeTimer()
        var updated = selections
        updated[question.id] = optionId
        selections = updated
        updateSession { session in
            session.selections = updated
        }
        registerReviewMetadata(for: question, selectedOptionId: optionId)
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
        commitCurrentQuestionTiming()
        currentIndex -= 1
        updateSession { session in
            session.currentIndex = currentIndex
        }
        restoreTimingForCurrentQuestion()
    }

    func jumpToQuestion(at index: Int) {
        guard index >= 0, index < questions.count else { return }
        commitCurrentQuestionTiming()
        currentIndex = index
        updateSession { session in
            session.currentIndex = currentIndex
        }
        restoreTimingForCurrentQuestion()
    }

    func advance() {
        guard state == .ready else { return }
        if currentIndex + 1 < questions.count {
            commitCurrentQuestionTiming()
            currentIndex += 1
            updateSession { session in
                session.currentIndex = currentIndex
            }
            restoreTimingForCurrentQuestion()
        } else {
            finishSession()
        }
    }

    func selection(for question: QuizSessionQuestion) -> String? {
        selections[question.id]
    }

    func isSelectionCorrect(for question: QuizSessionQuestion) -> Bool? {
        guard let choice = selections[question.id] else { return nil }
        return question.question.correctOptionId == choice
    }

    func toggleFlag(for question: QuizSessionQuestion) {
        var state = studyState(for: question.id)
        state.flagged.toggle()
        questionStates[question.id] = state
        localStore?.updateStudyState(state, for: question.id)
    }

    func setConfidence(_ confidence: QuestionStudyState.Confidence?, for question: QuizSessionQuestion) {
        var state = studyState(for: question.id)
        state.confidence = confidence
        state.updateDueDate()
        questionStates[question.id] = state
        localStore?.updateStudyState(state, for: question.id)
    }

    func updateNote(_ markdown: String, for question: QuizSessionQuestion) {
        var state = studyState(for: question.id)
        state.noteMarkdown = markdown
        questionStates[question.id] = state
        localStore?.updateStudyState(state, for: question.id)
    }

    func studyState(for questionID: String) -> QuestionStudyState {
        questionStates[questionID] ?? QuestionStudyState()
    }

    func studyState(for question: QuizSessionQuestion) -> QuestionStudyState {
        studyState(for: question.id)
    }

    func updateConfiguration(_ configuration: QuizSessionConfiguration) {
        self.configuration = configuration
        updateSession { session in
            session.configuration = configuration
        }
    }

    func pauseTimer() {
        isTimerPaused = true
        lastTickDate = nil
    }

    func resumeTimer() {
        guard state == .ready else { return }
        isTimerPaused = false
        lastTickDate = Date()
    }

    func synchronizeTimer() {
        guard !isTimerPaused else { return }
        handleTick()
    }

    func startReviewQueue(limit: Int) {
        guard let studyPlanner else { return }
        state = .loading
        let queue = studyPlanner.reviewQueue(limit: limit)
        guard !queue.isEmpty else {
            state = .error("No questions are due for review yet.")
            return
        }
        beginNewSession(with: queue, limit: nil)
    }

    func startAdaptiveDrill(limit: Int) {
        guard let studyPlanner else { return }
        state = .loading
        let questions = studyPlanner.adaptiveDrill(limit: limit)
        guard !questions.isEmpty else {
            state = .error("Unable to build an adaptive drill right now.")
            return
        }
        beginNewSession(with: questions, limit: nil)
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
            selections: [:],
            elapsedSeconds: 0,
            perQuestionSeconds: [:],
            configuration: configuration
        )
        sessionState = session
        if storeActiveSession {
            localStore?.saveActiveQuizSession(session)
        }
        state = .ready
        elapsedSeconds = 0
        currentQuestionSeconds = 0
        lastQuestionID = currentQuestion?.id
        lastPersistedElapsed = 0
        resumeTimer()
        startTimer()
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
        configuration = stored.configuration
        elapsedSeconds = stored.elapsedSeconds
        lastPersistedElapsed = stored.elapsedSeconds
        if stored.isCompleted {
            endDate = stored.lastUpdatedAt
            currentIndex = max(restoredQuestions.count - 1, 0)
            state = .completed
            currentQuestionSeconds = stored.perQuestionSeconds[currentQuestion?.id ?? ""] ?? 0
            timerCancellable?.cancel()
        } else {
            endDate = nil
            let cappedIndex = max(0, min(stored.currentIndex, restoredQuestions.count - 1))
            currentIndex = cappedIndex
            state = .ready
            currentQuestionSeconds = stored.perQuestionSeconds[currentQuestion?.id ?? ""] ?? 0
            lastQuestionID = currentQuestion?.id
            resumeTimer()
            startTimer()
        }
        return true
    }

    private func finishSession() {
        guard let localStore else { return }
        let finishDate = Date()
        timerCancellable?.cancel()
        synchronizeTimer()
        updateSession { session in
            session.currentIndex = questions.count
            session.elapsedSeconds = elapsedSeconds
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

    private func registerReviewMetadata(for question: QuizSessionQuestion, selectedOptionId: String) {
        guard let localStore else { return }
        let isCorrect = question.question.correctOptionId == selectedOptionId
        var state = studyState(for: question.id)
        state.registerReview(correct: isCorrect, secondsSpent: currentQuestionSeconds)
        questionStates[question.id] = state
        localStore.updateStudyState(state, for: question.id)
        updateSession { session in
            session.perQuestionSeconds[question.id] = currentQuestionSeconds
        }
    }

    private func commitCurrentQuestionTiming() {
        guard let question = currentQuestion else { return }
        synchronizeTimer()
        updateSession { session in
            session.perQuestionSeconds[question.id] = currentQuestionSeconds
            session.elapsedSeconds = elapsedSeconds
        }
        lastQuestionID = question.id
        lastPersistedElapsed = elapsedSeconds
    }

    private func restoreTimingForCurrentQuestion() {
        guard let session = sessionState, let question = currentQuestion else { return }
        let stored = session.perQuestionSeconds[question.id] ?? 0
        currentQuestionSeconds = stored
        lastQuestionID = question.id
        resumeTimer()
    }

    private func startTimer() {
        timerCancellable?.cancel()
        lastTickDate = Date()
        isTimerPaused = false
        timerCancellable = Timer.publish(every: 1, on: .main, in: .common)
            .autoconnect()
            .sink { [weak self] _ in
                self?.handleTick()
            }
    }

    private func handleTick() {
        guard !isTimerPaused else { return }
        let now = Date()
        guard let last = lastTickDate else {
            lastTickDate = now
            return
        }
        let delta = now.timeIntervalSince(last)
        lastTickDate = now
        elapsedSeconds += delta
        currentQuestionSeconds += delta
        if let questionID = currentQuestion?.id {
            sessionState?.perQuestionSeconds[questionID] = currentQuestionSeconds
        }
        sessionState?.elapsedSeconds = elapsedSeconds
        if elapsedSeconds - lastPersistedElapsed >= 5 {
            updateSession { session in
                session.elapsedSeconds = elapsedSeconds
                if let questionID = currentQuestion?.id {
                    session.perQuestionSeconds[questionID] = currentQuestionSeconds
                }
            }
            lastPersistedElapsed = elapsedSeconds
        }
    }
}
