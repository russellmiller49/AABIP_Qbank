import Combine
import Foundation
import Shared

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
    func answeredQuestionIDs() -> Set<String>
    var studyStatesPublisher: AnyPublisher<[String: QuestionStudyState], Never> { get }
    func studyState(for questionID: String) -> QuestionStudyState?
    func updateStudyState(_ state: QuestionStudyState, for questionID: String)
    func updateStudyStates(_ states: [String: QuestionStudyState])
    func allStudyStates() -> [String: QuestionStudyState]
    func resetProgress()
}

final class LocalStore: LocalStoreType {
    private enum Constants {
        static let downloadedKey = "AABIPIPREP.downloadedModules"
        static let activeQuizKey = "AABIPIPREP.activeQuizSession"
        static let completedQuizKey = "AABIPIPREP.completedQuizSessions"
        static let studyStatesKey = "AABIPIPREP.questionStudyStates"
    }

    private let defaults: UserDefaults
    private let subject: CurrentValueSubject<Set<String>, Never>
    private let activeSessionSubject: CurrentValueSubject<QuizSessionState?, Never>
    private let completedSessionsSubject: CurrentValueSubject<[CompletedQuizSession], Never>
    private let studyStatesSubject: CurrentValueSubject<[String: QuestionStudyState], Never>
    private let decoder = JSONDecoder()
    private let encoder = JSONEncoder()

    init(defaults: UserDefaults = .standard) {
        self.defaults = defaults
        let initial = Set(defaults.stringArray(forKey: Constants.downloadedKey) ?? [])
        self.subject = CurrentValueSubject<Set<String>, Never>(initial)

        if let data = defaults.data(forKey: Constants.activeQuizKey),
           let session = try? decoder.decode(QuizSessionState.self, from: data) {
            self.activeSessionSubject = CurrentValueSubject<QuizSessionState?, Never>(session)
        } else {
            self.activeSessionSubject = CurrentValueSubject<QuizSessionState?, Never>(nil)
        }

        if let data = defaults.data(forKey: Constants.completedQuizKey),
           let sessions = try? decoder.decode([CompletedQuizSession].self, from: data) {
            self.completedSessionsSubject = CurrentValueSubject<[CompletedQuizSession], Never>(sessions)
        } else {
            self.completedSessionsSubject = CurrentValueSubject<[CompletedQuizSession], Never>([])
        }

        if let data = defaults.data(forKey: Constants.studyStatesKey),
           let states = try? decoder.decode([String: QuestionStudyState].self, from: data) {
            self.studyStatesSubject = CurrentValueSubject<[String: QuestionStudyState], Never>(states)
        } else {
            self.studyStatesSubject = CurrentValueSubject<[String: QuestionStudyState], Never>([:])
        }
    }

    func warmStart() async {
        subject.send(subject.value)
        activeSessionSubject.send(activeSessionSubject.value)
        completedSessionsSubject.send(completedSessionsSubject.value)
        studyStatesSubject.send(studyStatesSubject.value)
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

    func answeredQuestionIDs() -> Set<String> {
        let sessions = completedSessionsSubject.value
        var ids: Set<String> = []
        for session in sessions {
            for questionID in session.selections.keys {
                ids.insert(questionID)
            }
        }
        return ids
    }

    var studyStatesPublisher: AnyPublisher<[String: QuestionStudyState], Never> {
        studyStatesSubject.eraseToAnyPublisher()
    }

    func studyState(for questionID: String) -> QuestionStudyState? {
        studyStatesSubject.value[questionID]
    }

    func allStudyStates() -> [String: QuestionStudyState] {
        studyStatesSubject.value
    }

    func updateStudyState(_ state: QuestionStudyState, for questionID: String) {
        var states = studyStatesSubject.value
        states[questionID] = state
        updateStudyStates(states)
    }

    func updateStudyStates(_ states: [String: QuestionStudyState]) {
        studyStatesSubject.send(states)
        if let data = try? encoder.encode(states) {
            defaults.set(data, forKey: Constants.studyStatesKey)
        }
    }

    func resetProgress() {
        completedSessionsSubject.send([])
        defaults.removeObject(forKey: Constants.completedQuizKey)
        saveActiveQuizSession(nil)
        defaults.removeObject(forKey: Constants.studyStatesKey)
        studyStatesSubject.send([:])
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
