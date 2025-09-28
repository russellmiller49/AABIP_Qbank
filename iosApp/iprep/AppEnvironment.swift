import Combine
import Foundation

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

    @Published public private(set) var downloadedModuleIDs: Set<String> = []
    @Published private(set) var activeQuizSession: QuizSessionState?
    @Published private(set) var completedQuizSessions: [CompletedQuizSession] = []
    @Published private(set) var studyStates: [String: QuestionStudyState] = [:]

    private init() {
        let authService = AuthService()
        let questionBankService = QuestionBankService()
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

        bindSyncTriggers()
        bindLocalStore()
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
    }

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
