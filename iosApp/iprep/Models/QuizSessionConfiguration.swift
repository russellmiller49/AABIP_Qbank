import Foundation

struct QuizSessionConfiguration: Codable, Equatable {
    var mode: QuizSessionMode
    var perQuestionTimerEnabled: Bool
    var autoPauseOnBackground: Bool

    static let `default` = QuizSessionConfiguration(mode: .study, perQuestionTimerEnabled: false, autoPauseOnBackground: true)
}

enum QuizSessionMode: String, Codable, CaseIterable, Identifiable {
    case study
    case exam

    var id: String { rawValue }

    var title: String {
        switch self {
        case .study:
            return "Study"
        case .exam:
            return "Exam"
        }
    }

    var description: String {
        switch self {
        case .study:
            return "See rationales immediately"
        case .exam:
            return "Hide rationales until completion"
        }
    }
}
