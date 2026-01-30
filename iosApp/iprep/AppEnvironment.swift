import Combine
import Foundation
#if canImport(Shared)
import Shared
#endif

@MainActor
public final class AppEnvironment: ObservableObject {
    public static let shared = AppEnvironment()

    let authService: AuthServiceType
    let firestoreService: FirestoreServiceType
    let storageService: StorageServiceType
    let remoteConfigService: RemoteConfigServiceType
    let featureFlags: FeatureFlags
    let mediaCache: MediaCacheType
    let syncManager: SyncManagerType
    let localStore: LocalStoreType
    let questionBankService: QuestionBankService
    let studyPlanner: StudyPlannerType
    let leaderboardService: LeaderboardServiceType

    private var cancellables: Set<AnyCancellable> = []
#if canImport(Shared)
    private let sharedCore: Shared.AppEnvironment
    private var sharedSessionFlow: FlowPublisher<Shared.QuizSessionState?>?
    private var sharedStudyStatesFlow: FlowPublisher<[String: Shared.QuestionStudyState]>?
    private var sharedSessionID: UUID?
    private var sharedSessionStartedAt: Date?
    private var sharedSessionSignature: String?
#endif

    @Published public private(set) var downloadedModuleIDs: Set<String> = []
    @Published private(set) var activeQuizSession: QuizSessionState?
    @Published private(set) var completedQuizSessions: [CompletedQuizSession] = []
    @Published private(set) var studyStates: [String: QuestionStudyState] = [:]

    private init() {
        print("[AppEnvironment] Starting initialization...")
        let authService = AuthService()
        print("[AppEnvironment] AuthService created")
#if canImport(Shared)
        print("[AppEnvironment] Creating new Shared.AppEnvironment directly...")
        // Create Kotlin AppEnvironment directly instead of using companion singleton
        // to avoid potential threading/timing issues
        let sharedCore = Shared.AppEnvironment()
        print("[AppEnvironment] sharedCore created: \(sharedCore)")
        self.sharedCore = sharedCore
        print("[AppEnvironment] Creating QuestionBankService with core...")
        let questionBankService = QuestionBankService(core: sharedCore.questionBankService)
        print("[AppEnvironment] QuestionBankService created")
#else
        let questionBankService = QuestionBankService()
#endif
        let firestoreService = FirestoreService(questionBank: questionBankService)
        let storageService = StorageService()
        let remoteConfigService = RemoteConfigService()
        let mediaCache = MediaCache()
        let localStore = LocalStore()
        let syncManager = SyncManager(localStore: localStore, firestore: firestoreService)
        let studyPlanner = StudyPlanner(questionBank: questionBankService, localStore: localStore)
        let leaderboardService = LeaderboardService()

        self.authService = authService
        self.firestoreService = firestoreService
        self.storageService = storageService
        self.remoteConfigService = remoteConfigService
        self.mediaCache = mediaCache
        self.localStore = localStore
        self.syncManager = syncManager
        self.featureFlags = FeatureFlags(remoteConfig: remoteConfigService)
        self.questionBankService = questionBankService
        self.studyPlanner = studyPlanner
        self.leaderboardService = leaderboardService

        print("[AppEnvironment] All services assigned, binding triggers...")
        bindSyncTriggers()
        bindLocalStore()
        print("[AppEnvironment] Initialization complete!")
    }

    private func bindSyncTriggers() {
        authService.userDidChange
            .sink { [weak syncManager] _ in
                syncManager?.scheduleSync()
            }
            .store(in: &cancellables)
    }

    private func bindLocalStore() {
        localStore.downloadedModuleIDsPublisher
            .receive(on: RunLoop.main)
            .sink { [weak self] ids in
                self?.downloadedModuleIDs = ids
            }
            .store(in: &cancellables)

        localStore.activeQuizSessionPublisher
            .receive(on: RunLoop.main)
            .sink { [weak self] session in
                self?.activeQuizSession = session
            }
            .store(in: &cancellables)

        localStore.completedQuizSessionsPublisher
            .receive(on: RunLoop.main)
            .sink { [weak self] sessions in
                self?.completedQuizSessions = sessions
            }
            .store(in: &cancellables)

        localStore.studyStatesPublisher
            .receive(on: RunLoop.main)
            .sink { [weak self] states in
                self?.studyStates = states
            }
            .store(in: &cancellables)

#if canImport(Shared)
        bindSharedFlows()
#endif
    }

#if canImport(Shared)
    /// Expose the shared duel engine for SwiftUI screens.
    var duelEngineCore: Shared.DuelEngineService {
        sharedCore.duelEngineService
    }
#endif

#if canImport(Shared)
    private func bindSharedFlows() {
        let sessionFlow = FlowPublisher(flow: sharedCore.quizSessionService.currentSession) { value in
            value as? Shared.QuizSessionState
        }
        self.sharedSessionFlow = sessionFlow
        sessionFlow.publisher
            .receive(on: RunLoop.main)
            .sink { [weak self] sharedSession in
                guard let self else { return }
                let mapped = self.mapSharedSession(sharedSession)
                self.localStore.saveActiveQuizSession(mapped)
            }
            .store(in: &cancellables)

        let studyStatesFlow = FlowPublisher(flow: sharedCore.studyPlannerService.questionStudyStates) { [weak self] value in
            self?.sharedStudyStateMap(from: value) ?? [:]
        }
        self.sharedStudyStatesFlow = studyStatesFlow
        studyStatesFlow.publisher
            .receive(on: RunLoop.main)
            .sink { [weak self] sharedStates in
                self?.mergeSharedStudyStates(sharedStates)
            }
            .store(in: &cancellables)
    }

    private func mapSharedSession(_ sharedSession: Shared.QuizSessionState?) -> QuizSessionState? {
        guard let sharedSession else {
            sharedSessionID = nil
            sharedSessionStartedAt = nil
            sharedSessionSignature = nil
            return nil
        }

        let signature = sessionSignature(for: sharedSession)
        if sharedSessionSignature != signature {
            sharedSessionSignature = signature
            sharedSessionID = UUID()
            sharedSessionStartedAt = Date()
        }

        let references = sharedSession.questions.map {
            QuizSessionQuestionReference(moduleID: $0.module.id, questionID: $0.question.id)
        }
        let selections = swiftStringMap(from: sharedSession.answers)
        let existing = localStore.activeQuizSession()

        return QuizSessionState(
            id: sharedSessionID ?? existing?.id ?? UUID(),
            startedAt: existing?.startedAt ?? sharedSessionStartedAt ?? Date(),
            lastUpdatedAt: Date(),
            currentIndex: Int(sharedSession.currentQuestionIndex),
            questionReferences: references,
            selections: selections,
            elapsedSeconds: existing?.elapsedSeconds ?? 0,
            perQuestionSeconds: existing?.perQuestionSeconds ?? [:],
            configuration: existing?.configuration ?? .default
        )
    }

    private func mergeSharedStudyStates(_ sharedStates: [String: Shared.QuestionStudyState]) {
        guard !sharedStates.isEmpty else { return }
        var merged = localStore.allStudyStates()
        for (questionID, sharedState) in sharedStates {
            merged[questionID] = mergedStudyState(existing: merged[questionID], shared: sharedState)
        }
        localStore.updateStudyStates(merged)
    }

    private func mergedStudyState(existing: QuestionStudyState?, shared: Shared.QuestionStudyState) -> QuestionStudyState {
        var state = existing ?? QuestionStudyState()
        let timesAnswered = Int(shared.timesAnswered)
        let timesCorrect = Int(shared.timesCorrect)
        state.reviewCount = max(state.reviewCount, timesAnswered)
        state.correctCount = max(state.correctCount, timesCorrect)

        if state.lastReviewedAt == nil {
            state.lastReviewedAt = dateFromSharedMillis(shared.lastAnsweredAt)
        }
        if state.dueDate == nil, let lastReviewedAt = state.lastReviewedAt {
            state.dueDate = lastReviewedAt
        }
        return state
    }

    private func sessionSignature(for session: Shared.QuizSessionState) -> String {
        session.questions
            .map { "\($0.module.id):\($0.question.id)" }
            .joined(separator: "|")
    }

    private func sharedStudyStateMap(from value: Any?) -> [String: Shared.QuestionStudyState] {
        if let typed = value as? [String: Shared.QuestionStudyState] {
            return typed
        }
        guard let dictionary = value as? NSDictionary else { return [:] }
        var result: [String: Shared.QuestionStudyState] = [:]
        for (key, raw) in dictionary {
            guard let key = key as? String, let raw = raw as? Shared.QuestionStudyState else { continue }
            result[key] = raw
        }
        return result
    }

    private func swiftStringMap(from value: Any?) -> [String: String] {
        if let typed = value as? [String: String] {
            return typed
        }
        guard let dictionary = value as? NSDictionary else { return [:] }
        var result: [String: String] = [:]
        for (key, raw) in dictionary {
            guard let key = key as? String, let raw = raw as? String else { continue }
            result[key] = raw
        }
        return result
    }

    private func dateFromSharedMillis(_ millis: KotlinLong?) -> Date? {
        guard let millis else { return nil }
        let value = millis.int64Value
        guard value > 0 else { return nil }
        return Date(timeIntervalSince1970: TimeInterval(value) / 1000)
    }
#endif

    func incorrectQuestionCount() -> Int {
        let sessions = localStore.completedQuizSessions()
        var seen = Set<String>()
        var count = 0
        for session in sessions {
            for reference in session.questionReferences {
                guard let sessionQuestion = questionBankService.sessionQuestion(for: reference) else { continue }
                let questionID = sessionQuestion.question.id
                if session.selections[questionID] != sessionQuestion.question.correctOptionId,
                   seen.insert(questionID).inserted {
                    count += 1
                }
            }
        }
        return count
    }

    func hasIncorrectQuestions() -> Bool {
        incorrectQuestionCount() > 0
    }


    func answeredQuestionIDs() -> Set<String> {
        localStore.answeredQuestionIDs()
    }

    func studyState(for questionID: String) -> QuestionStudyState? {
        localStore.studyState(for: questionID)
    }

    func updateStudyState(_ state: QuestionStudyState, for questionID: String) {
        localStore.updateStudyState(state, for: questionID)
    }

    func reviewQueue(limit: Int) -> [QuizSessionQuestion] {
        studyPlanner.reviewQueue(limit: limit)
    }

    func adaptiveDrillQuestions(limit: Int) -> [QuizSessionQuestion] {
        studyPlanner.adaptiveDrill(limit: limit)
    }

    func leaderboardSnapshot() -> LeaderboardSnapshot? {
        leaderboardService.refreshSnapshot(questionBank: questionBankService, sessions: completedQuizSessions)
    }

    func leaderboardOptIn() -> Bool {
        leaderboardService.isOptedIn
    }

    func setLeaderboardOptIn(_ value: Bool) {
        leaderboardService.setOptIn(value)
    }

    func leaderboardAlias() -> String {
        leaderboardService.participantAlias
    }

    func setLeaderboardAlias(_ alias: String) {
        leaderboardService.setAlias(alias)
    }

    func resetPracticeProgress() {
        localStore.resetProgress()
    }

    func markModuleDownloaded(_ id: String) {
        localStore.markModuleDownloaded(id)
    }

    func removeDownloadedModule(_ id: String) {
        localStore.removeDownload(for: id)
    }

    func isModuleDownloaded(_ id: String) -> Bool {
        localStore.isModuleDownloaded(id)
    }
}
