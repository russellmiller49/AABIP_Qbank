import Foundation

protocol SyncManagerType: AnyObject {
    func scheduleSync()
}

final class SyncManager: SyncManagerType {
    private let localStore: LocalStoreType
    private let firestore: FirestoreServiceType
    private let queue = DispatchQueue(label: "SyncManager.queue", qos: .background)

    init(localStore: LocalStoreType, firestore: FirestoreServiceType) {
        self.localStore = localStore
        self.firestore = firestore
    }

    func scheduleSync() {
        queue.async { [localStore] in
            Task { await localStore.warmStart() }
        }
    }
}
