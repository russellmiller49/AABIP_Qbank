import Combine
import Foundation
import Shared

@MainActor
final class DuelStore: ObservableObject {
    @Published private(set) var data: Shared.DuelPersistenceData

    private let key = "AABIPIPREP.duelData"
    private let defaults: UserDefaults

    init(userDefaults: UserDefaults = .standard) {
        self.defaults = userDefaults
        if let blob = userDefaults.string(forKey: key), !blob.isEmpty {
            self.data = Shared.DuelPersistenceData.companion.decode(jsonString: blob)
        } else {
            self.data = Shared.DuelPersistenceData.companion.empty
        }
    }

    func save() {
        let encoded = Shared.DuelPersistenceData.companion.encode(data: data)
        defaults.set(encoded, forKey: key)
    }

    func updateProfile(_ profile: Shared.PlayerProfile) {
        data = Shared.DuelPersistenceData(
            playerProfile: profile,
            recentDuels: data.recentDuels,
            recentlySeenQuestionIds: data.recentlySeenQuestionIds,
            recentlyMissedQuestionIds: data.recentlyMissedQuestionIds
        )
        save()
    }

    func updateRecentQuestionIds(seen: [String], missed: [String]) {
        data = Shared.DuelPersistenceData(
            playerProfile: data.playerProfile,
            recentDuels: data.recentDuels,
            recentlySeenQuestionIds: seen,
            recentlyMissedQuestionIds: missed
        )
        save()
    }

    func addCompletedDuel(_ duel: Shared.CompletedDuel) {
        var updated = data.recentDuels
        updated.insert(duel, at: 0)
        if updated.count > 20 {
            updated = Array(updated.prefix(20))
        }

        data = Shared.DuelPersistenceData(
            playerProfile: data.playerProfile,
            recentDuels: updated,
            recentlySeenQuestionIds: data.recentlySeenQuestionIds,
            recentlyMissedQuestionIds: data.recentlyMissedQuestionIds
        )
        save()
    }

    func weakTopics(limit: Int = 3) -> [String] {
        // Kotlin Map<String, Float> bridges as [String: KotlinFloat] (NSNumber).
        let map = data.playerProfile.topicMastery
        let pairs: [(String, Float)] = map.compactMap { key, value in
            guard let key = key as? String else { return nil }
            let number = value as? NSNumber
            return (key, number?.floatValue ?? 0.5)
        }

        return pairs
            .sorted(by: { $0.1 < $1.1 })
            .prefix(limit)
            .map { $0.0 }
    }
}
