import Foundation

public struct Module: Identifiable, Hashable {
    public let id: String
    public let title: String
    public let description: String
    public let questionCount: Int
    public let estimatedTimeMinutes: Int
    public let difficulty: Difficulty

    public init(
        id: String,
        title: String,
        description: String,
        questionCount: Int,
        estimatedTimeMinutes: Int,
        difficulty: Difficulty
    ) {
        self.id = id
        self.title = title
        self.description = description
        self.questionCount = questionCount
        self.estimatedTimeMinutes = estimatedTimeMinutes
        self.difficulty = difficulty
    }

    public enum Difficulty: String {
        case easy
        case moderate
        case hard
    }
}

public extension Module {
    static let placeholder: [Module] = [
        Module(
            id: "advanced-bronchoscopy",
            title: "Advanced Therapeutic Bronchoscopy",
            description: "Latest interventional techniques and peri-procedural care.",
            questionCount: 42,
            estimatedTimeMinutes: 35,
            difficulty: .hard
        ),
        Module(
            id: "airway-disease",
            title: "Airway Disease",
            description: "Diagnosis and management pathways for airway disorders.",
            questionCount: 38,
            estimatedTimeMinutes: 30,
            difficulty: .moderate
        ),
        Module(
            id: "pleural-disease",
            title: "Pleural Disease",
            description: "Evidence-based approaches to pleural pathology.",
            questionCount: 24,
            estimatedTimeMinutes: 20,
            difficulty: .moderate
        )
    ]
}
