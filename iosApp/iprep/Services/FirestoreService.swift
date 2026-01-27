import Foundation

protocol FirestoreServiceType: AnyObject {
    func fetchModules() async throws -> [Module]
    func fetchDashboardSnapshot() async throws -> DashboardSnapshot
}

struct DashboardSnapshot {
    let streakCount: Int
    let correctRate: Double
    let recentActivityDescription: String
}

final class FirestoreService: FirestoreServiceType {
    private let questionBank: QuestionBankService

    init(questionBank: QuestionBankService) {
        self.questionBank = questionBank
    }

    func fetchModules() async throws -> [Module] {
        try await Task.sleep(nanoseconds: 25_000_000)
        return questionBank.moduleSummaries()
    }

    func fetchDashboardSnapshot() async throws -> DashboardSnapshot {
        try await Task.sleep(nanoseconds: 25_000_000)
        let moduleCount = questionBank.moduleCount()
        let questionCount = questionBank.totalQuestionCount
        let estimatedMinutes = questionBank.moduleSummaries().reduce(0) { $0 + Int($1.estimatedTimeMinutes) }
        let activity = "\(moduleCount) modules • \(questionCount) questions ready • ~\(estimatedMinutes) min of study"
        // Use a deterministic derived rate to avoid feeling random between launches.
        let baselineRate = min(0.92, max(0.55, Double(questionCount % 100) / 100.0 + 0.6))
        return DashboardSnapshot(
            streakCount: max(3, moduleCount + 1),
            correctRate: baselineRate,
            recentActivityDescription: activity
        )
    }
}
