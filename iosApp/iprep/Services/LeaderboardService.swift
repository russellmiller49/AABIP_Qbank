import Foundation
import Shared

struct LeaderboardSnapshot: Equatable {
    struct DomainScore: Identifiable, Equatable {
        let id: String
        let title: String
        let percentile: Double
        let accuracy: Double
    }

    let participantID: String
    let alias: String
    let domains: [DomainScore]
}

protocol LeaderboardServiceType: AnyObject {
    var isOptedIn: Bool { get }
    var participantID: String { get }
    var participantAlias: String { get }
    func setOptIn(_ newValue: Bool)
    func setAlias(_ alias: String)
    func refreshSnapshot(questionBank: QuestionBankService, sessions: [CompletedQuizSession]) -> LeaderboardSnapshot?
}

final class LeaderboardService: LeaderboardServiceType {
    private enum Constants {
        static let optInKey = "AABIPIPREP.leaderboard.optIn"
        static let idKey = "AABIPIPREP.leaderboard.participant"
        static let aliasKey = "AABIPIPREP.leaderboard.alias"
    }

    private let defaults: UserDefaults

    init(defaults: UserDefaults = .standard) {
        self.defaults = defaults
    }

    var isOptedIn: Bool {
        defaults.bool(forKey: Constants.optInKey)
    }

    var participantID: String {
        if let stored = defaults.string(forKey: Constants.idKey) {
            return stored
        }
        let id = UUID().uuidString
        defaults.set(id, forKey: Constants.idKey)
        return id
    }

    var participantAlias: String {
        if let stored = defaults.string(forKey: Constants.aliasKey), !stored.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
            return stored
        }
        let alias = defaultAlias()
        defaults.set(alias, forKey: Constants.aliasKey)
        return alias
    }

    func setOptIn(_ newValue: Bool) {
        defaults.set(newValue, forKey: Constants.optInKey)
    }

    func setAlias(_ alias: String) {
        let trimmed = alias.trimmingCharacters(in: .whitespacesAndNewlines)
        if trimmed.isEmpty {
            defaults.set(defaultAlias(), forKey: Constants.aliasKey)
        } else {
            defaults.set(String(trimmed.prefix(24)), forKey: Constants.aliasKey)
        }
    }

    func refreshSnapshot(questionBank: QuestionBankService, sessions: [CompletedQuizSession]) -> LeaderboardSnapshot? {
        guard isOptedIn else { return nil }
        var domainStats: [String: (correct: Int, total: Int, title: String)] = [:]
        for module in questionBank.moduleSummaries() {
            domainStats[module.id] = (0, 0, module.title)
        }

        for session in sessions.prefix(25) {
            for reference in session.questionReferences {
                guard var stats = domainStats[reference.moduleID],
                      let question = questionBank.sessionQuestion(for: reference) else { continue }
                stats.total += 1
                if session.selections[question.question.id] == question.question.correctOptionId {
                    stats.correct += 1
                }
                domainStats[reference.moduleID] = stats
            }
        }

        let domains: [LeaderboardSnapshot.DomainScore] = domainStats.compactMap { key, value in
            guard value.total > 0 else { return nil }
            let accuracy = Double(value.correct) / Double(value.total)
            // Deterministic percentile approximation comparing against a synthetic cohort.
            let percentile = max(0.05, min(0.99, 0.45 + accuracy * 0.5 + Double(participantID.hashValue & 0xFF) / 1024.0))
            return LeaderboardSnapshot.DomainScore(id: key, title: value.title, percentile: percentile, accuracy: accuracy)
        }
        .sorted { lhs, rhs in lhs.percentile > rhs.percentile }

        return LeaderboardSnapshot(participantID: participantID, alias: participantAlias, domains: domains)
    }

    private func defaultAlias() -> String {
        let suffix = participantID.replacingOccurrences(of: "-", with: "").prefix(6)
        return "Learner-\(suffix.uppercased())"
    }
}
