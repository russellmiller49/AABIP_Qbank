import Combine
import Foundation

protocol LocalStoreType: AnyObject {
    func warmStart() async
    var downloadedModuleIDsPublisher: AnyPublisher<Set<String>, Never> { get }
    func isModuleDownloaded(_ id: String) -> Bool
    func markModuleDownloaded(_ id: String)
    func removeDownload(for id: String)
    var activeQuizSessionPublisher: AnyPublisher<QuizSessionState?, Never> { get }
    func activeQuizSession() -> QuizSessionState?
    func saveActiveQuizSession(_ session: QuizSessionState?)
    var completedQuizSessionsPublisher: AnyPublisher<[CompletedQuizSession], Never> { get }
    func completedQuizSessions() -> [CompletedQuizSession]
    func addCompletedQuizSession(_ session: CompletedQuizSession)
}

final class LocalStore: LocalStoreType {
    private enum Constants {
        static let downloadedKey = "AABIPIPREP.downloadedModules"
        static let activeQuizKey = "AABIPIPREP.activeQuizSession"
        static let completedQuizKey = "AABIPIPREP.completedQuizSessions"
    }

    private let defaults: UserDefaults
    private let subject: CurrentValueSubject<Set<String>, Never>
    private let activeSessionSubject: CurrentValueSubject<QuizSessionState?, Never>
    private let completedSessionsSubject: CurrentValueSubject<[CompletedQuizSession], Never>
    private let decoder = JSONDecoder()
    private let encoder = JSONEncoder()

    init(defaults: UserDefaults = .standard) {
        self.defaults = defaults
        let initial = Set(defaults.stringArray(forKey: Constants.downloadedKey) ?? [])
        self.subject = CurrentValueSubject(initial)

        if let data = defaults.data(forKey: Constants.activeQuizKey),
           let session = try? decoder.decode(QuizSessionState.self, from: data) {
            self.activeSessionSubject = CurrentValueSubject(session)
        } else {
            self.activeSessionSubject = CurrentValueSubject(nil)
        }

        if let data = defaults.data(forKey: Constants.completedQuizKey),
           let sessions = try? decoder.decode([CompletedQuizSession].self, from: data) {
            self.completedSessionsSubject = CurrentValueSubject(sessions)
        } else {
            self.completedSessionsSubject = CurrentValueSubject([])
        }
    }

    func warmStart() async {
        subject.send(subject.value)
        activeSessionSubject.send(activeSessionSubject.value)
        completedSessionsSubject.send(completedSessionsSubject.value)
    }

    var downloadedModuleIDsPublisher: AnyPublisher<Set<String>, Never> {
        subject.eraseToAnyPublisher()
    }

    func isModuleDownloaded(_ id: String) -> Bool {
        subject.value.contains(id)
    }

    func markModuleDownloaded(_ id: String) {
        var current = subject.value
        guard !current.contains(id) else { return }
        current.insert(id)
        subject.send(current)
        defaults.set(Array(current), forKey: Constants.downloadedKey)
    }

    func removeDownload(for id: String) {
        var current = subject.value
        guard current.contains(id) else { return }
        current.remove(id)
        subject.send(current)
        defaults.set(Array(current), forKey: Constants.downloadedKey)
    }

    var activeQuizSessionPublisher: AnyPublisher<QuizSessionState?, Never> {
        activeSessionSubject.eraseToAnyPublisher()
    }

    func activeQuizSession() -> QuizSessionState? {
        activeSessionSubject.value
    }

    func saveActiveQuizSession(_ session: QuizSessionState?) {
        activeSessionSubject.send(session)
        if let session {
            if let data = try? encoder.encode(session) {
                defaults.set(data, forKey: Constants.activeQuizKey)
            }
        } else {
            defaults.removeObject(forKey: Constants.activeQuizKey)
        }
    }

    var completedQuizSessionsPublisher: AnyPublisher<[CompletedQuizSession], Never> {
        completedSessionsSubject.eraseToAnyPublisher()
    }

    func completedQuizSessions() -> [CompletedQuizSession] {
        completedSessionsSubject.value
    }

    func addCompletedQuizSession(_ session: CompletedQuizSession) {
        var current = completedSessionsSubject.value
        current.append(session)
        current.sort { $0.completedAt > $1.completedAt }
        if current.count > 50 {
            current = Array(current.prefix(50))
        }
        completedSessionsSubject.send(current)
        if let data = try? encoder.encode(current) {
            defaults.set(data, forKey: Constants.completedQuizKey)
        }
        // Clearing any active session when a completion is recorded ensures consistency.
        saveActiveQuizSession(nil)
    }
}
