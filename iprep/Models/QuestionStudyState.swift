import Foundation

struct QuestionStudyState: Codable, Equatable, Hashable {
    enum Confidence: String, CaseIterable, Codable, Identifiable {
        case guess
        case low
        case medium
        case high

        var id: String { rawValue }

        var title: String {
            switch self {
            case .guess:
                return "Guess"
            case .low:
                return "Low"
            case .medium:
                return "Medium"
            case .high:
                return "High"
            }
        }

        var iconName: String {
            switch self {
            case .guess:
                return "questionmark"
            case .low:
                return "exclamationmark"
            case .medium:
                return "hand.raised"
            case .high:
                return "checkmark"
            }
        }

        /// Suggested spaced-repetition interval multiplier.
        var intervalMultiplier: Double {
            switch self {
            case .guess:
                return 0.5
            case .low:
                return 1
            case .medium:
                return 2
            case .high:
                return 4
            }
        }
    }

    var flagged: Bool
    var confidence: Confidence?
    var noteMarkdown: String
    var lastReviewedAt: Date?
    var dueAt: Date?
    var totalReviews: Int
    var correctCount: Int
    var incorrectCount: Int
    var averageSecondsSpent: TimeInterval

    init(
        flagged: Bool = false,
        confidence: Confidence? = nil,
        noteMarkdown: String = "",
        lastReviewedAt: Date? = nil,
        dueAt: Date? = nil,
        totalReviews: Int = 0,
        correctCount: Int = 0,
        incorrectCount: Int = 0,
        averageSecondsSpent: TimeInterval = 0
    ) {
        self.flagged = flagged
        self.confidence = confidence
        self.noteMarkdown = noteMarkdown
        self.lastReviewedAt = lastReviewedAt
        self.dueAt = dueAt
        self.totalReviews = totalReviews
        self.correctCount = correctCount
        self.incorrectCount = incorrectCount
        self.averageSecondsSpent = averageSecondsSpent
    }

    mutating func registerReview(correct: Bool, secondsSpent: TimeInterval, referenceDate: Date = Date()) {
        totalReviews += 1
        if correct {
            correctCount += 1
        } else {
            incorrectCount += 1
        }
        if averageSecondsSpent <= 0 {
            averageSecondsSpent = secondsSpent
        } else {
            let totalSeconds = averageSecondsSpent * Double(totalReviews - 1) + secondsSpent
            averageSecondsSpent = totalSeconds / Double(totalReviews)
        }
        lastReviewedAt = referenceDate
        updateDueDate(referenceDate: referenceDate)
    }

    mutating func updateDueDate(referenceDate: Date = Date()) {
        guard let confidence else {
            dueAt = referenceDate
            return
        }
        let baseInterval: TimeInterval
        if totalReviews <= 1 {
            baseInterval = 60 * 60 * 24 // 1 day for first review
        } else {
            baseInterval = pow(2, Double(totalReviews - 1)) * 60 * 60 * 24
        }
        let adjustedInterval = baseInterval * confidence.intervalMultiplier
        dueAt = referenceDate.addingTimeInterval(adjustedInterval)
    }

    var needsReview: Bool {
        guard let dueAt else { return true }
        return dueAt <= Date()
    }

    var successRate: Double {
        guard totalReviews > 0 else { return 0 }
        return Double(correctCount) / Double(totalReviews)
    }
}
