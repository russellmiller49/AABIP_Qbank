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

    private var cancellables: Set<AnyCancellable> = []

    @Published public private(set) var downloadedModuleIDs: Set<String> = []
    @Published private(set) var activeQuizSession: QuizSessionState?
    @Published private(set) var completedQuizSessions: [CompletedQuizSession] = []

    private init() {
        let authService = AuthService()
        let questionBankService = QuestionBankService()
        let firestoreService = FirestoreService(questionBank: questionBankService)
        let storageService = StorageService()
        let remoteConfigService = RemoteConfigService()
        let mediaCache = MediaCache()
        let localStore = LocalStore()
        let syncManager = SyncManager(localStore: localStore, firestore: firestoreService)

        self.authService = authService
        self.firestoreService = firestoreService
        self.storageService = storageService
        self.remoteConfigService = remoteConfigService
        self.mediaCache = mediaCache
        self.localStore = localStore
        self.syncManager = syncManager
        self.featureFlags = FeatureFlags(remoteConfig: remoteConfigService)
        self.questionBankService = questionBankService

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
