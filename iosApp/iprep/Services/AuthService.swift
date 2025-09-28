import Combine
import Foundation

protocol AuthServiceType: AnyObject {
    var currentUser: AuthUser? { get }
    var userDidChange: AnyPublisher<AuthUser?, Never> { get }
    func signInIfNeeded()
}

struct AuthUser: Equatable {
    let id: String
    let displayName: String?
}

final class AuthService: AuthServiceType {
    private let subject = CurrentValueSubject<AuthUser?, Never>(nil)
    private var cancellables: Set<AnyCancellable> = []

    init() {
        signInIfNeeded()
    }

    var currentUser: AuthUser? {
        subject.value
    }

    var userDidChange: AnyPublisher<AuthUser?, Never> {
        subject.eraseToAnyPublisher()
    }

    func signInIfNeeded() {
        guard subject.value == nil else { return }
        let anonUser = AuthUser(id: UUID().uuidString, displayName: nil)
        subject.send(anonUser)
    }
}
