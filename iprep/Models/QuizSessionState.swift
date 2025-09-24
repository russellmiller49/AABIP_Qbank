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
    var elapsedSeconds: TimeInterval
    var perQuestionSeconds: [String: TimeInterval]
    var configuration: QuizSessionConfiguration

    init(
        id: UUID,
        startedAt: Date,
        lastUpdatedAt: Date,
        currentIndex: Int,
        questionReferences: [QuizSessionQuestionReference],
        selections: [String: String],
        elapsedSeconds: TimeInterval = 0,
        perQuestionSeconds: [String: TimeInterval] = [:],
        configuration: QuizSessionConfiguration = .default
    ) {
        self.id = id
        self.startedAt = startedAt
        self.lastUpdatedAt = lastUpdatedAt
        self.currentIndex = currentIndex
        self.questionReferences = questionReferences
        self.selections = selections
        self.elapsedSeconds = elapsedSeconds
        self.perQuestionSeconds = perQuestionSeconds
        self.configuration = configuration
    }

    var totalQuestions: Int { questionReferences.count }
    var answeredQuestionIDs: Set<String> { Set(selections.keys) }
    var isCompleted: Bool { currentIndex >= totalQuestions }
}

extension QuizSessionState {
    private enum CodingKeys: String, CodingKey {
        case id
        case startedAt
        case lastUpdatedAt
        case currentIndex
        case questionReferences
        case selections
        case elapsedSeconds
        case perQuestionSeconds
        case configuration
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let id = try container.decode(UUID.self, forKey: .id)
        let startedAt = try container.decode(Date.self, forKey: .startedAt)
        let lastUpdatedAt = try container.decode(Date.self, forKey: .lastUpdatedAt)
        let currentIndex = try container.decode(Int.self, forKey: .currentIndex)
        let questionReferences = try container.decode([QuizSessionQuestionReference].self, forKey: .questionReferences)
        let selections = try container.decode([String: String].self, forKey: .selections)
        let elapsedSeconds = try container.decodeIfPresent(TimeInterval.self, forKey: .elapsedSeconds) ?? 0
        let perQuestionSeconds = try container.decodeIfPresent([String: TimeInterval].self, forKey: .perQuestionSeconds) ?? [:]
        let configuration = try container.decodeIfPresent(QuizSessionConfiguration.self, forKey: .configuration) ?? .default

        self.init(
            id: id,
            startedAt: startedAt,
            lastUpdatedAt: lastUpdatedAt,
            currentIndex: currentIndex,
            questionReferences: questionReferences,
            selections: selections,
            elapsedSeconds: elapsedSeconds,
            perQuestionSeconds: perQuestionSeconds,
            configuration: configuration
        )
    }
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
