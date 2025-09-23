import Foundation

struct QuizSessionQuestionReference: Codable, Hashable {
    let moduleID: String
    let questionID: String
}

struct QuizSessionState: Codable, Equatable {
    let id: UUID
    let startedAt: Date
    var lastUpdatedAt: Date
    var currentIndex: Int
    var questionReferences: [QuizSessionQuestionReference]
    var selections: [String: String]

    var totalQuestions: Int { questionReferences.count }
    var answeredQuestionIDs: Set<String> { Set(selections.keys) }
    var isCompleted: Bool { currentIndex >= totalQuestions }
}

struct CompletedQuizSession: Codable, Identifiable, Equatable, Hashable {
    let id: UUID
    let startedAt: Date
    let completedAt: Date
    let duration: TimeInterval
    let totalQuestions: Int
    let correctCount: Int
    let questionReferences: [QuizSessionQuestionReference]
    let selections: [String: String]

    var accuracy: Double {
        guard totalQuestions > 0 else { return 0 }
        return Double(correctCount) / Double(totalQuestions)
    }

    static func == (lhs: CompletedQuizSession, rhs: CompletedQuizSession) -> Bool {
        lhs.id == rhs.id
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
