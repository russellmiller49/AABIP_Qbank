import Foundation

/// Tracks a learner's personal study metadata for a specific question.
/// Persisted locally via `LocalStore` and used by study planning and UI.
struct QuestionStudyState: Codable, Equatable {
    /// Self-assessed confidence levels after answering a question.
    enum Confidence: String, CaseIterable, Identifiable, Codable {
        case guess
        case low
        case medium
        case high

        var id: String { rawValue }

        /// Human-readable title for UI.
        var title: String {
            switch self {
            case .guess: return "Guess"
            case .low: return "Low"
            case .medium: return "Medium"
            case .high: return "High"
            }
        }

        /// SF Symbol name for use in chips/buttons.
        var iconName: String {
            switch self {
            case .guess: return "questionmark.circle"
            case .low: return "hand.thumbsdown"
            case .medium: return "hand.raised"
            case .high: return "hand.thumbsup"
            }
        }
    }

    /// Whether the question is flagged for later review.
    var flagged: Bool = false
    /// Optional confidence rating set by the user.
    var confidence: Confidence? = nil
    /// Free-form markdown notes authored by the user.
    var noteMarkdown: String = ""

    /// Last time the question was reviewed in a session.
    var lastReviewedAt: Date? = nil
    /// Total number of reviews across sessions.
    var reviewCount: Int = 0
    /// Number of times answered correctly.
    var correctCount: Int = 0
    /// Total time spent on this question (seconds).
    var totalSeconds: TimeInterval = 0

    /// Next suggested review date (spaced repetition heuristic).
    var dueDate: Date? = nil

    init(
        flagged: Bool = false,
        confidence: Confidence? = nil,
        noteMarkdown: String = "",
        lastReviewedAt: Date? = nil,
        reviewCount: Int = 0,
        correctCount: Int = 0,
        totalSeconds: TimeInterval = 0,
        dueDate: Date? = nil
    ) {
        self.flagged = flagged
        self.confidence = confidence
        self.noteMarkdown = noteMarkdown
        self.lastReviewedAt = lastReviewedAt
        self.reviewCount = reviewCount
        self.correctCount = correctCount
        self.totalSeconds = totalSeconds
        self.dueDate = dueDate
    }

    /// Register a review outcome and update scheduling metadata.
    /// - Parameters:
    ///   - correct: Whether the user's selection was correct.
    ///   - secondsSpent: Time spent on the question during this interaction.
    mutating func registerReview(correct: Bool, secondsSpent: TimeInterval) {
        reviewCount += 1
        if correct { correctCount += 1 }
        totalSeconds += max(0, secondsSpent)
        lastReviewedAt = Date()
        updateDueDate()
    }

    /// Recompute the next due date based on current confidence and performance.
    /// Uses a simple spaced repetition heuristic that lengthens intervals as
    /// confidence and correctness improve.
    mutating func updateDueDate() {
        let baseDate = lastReviewedAt ?? Date()
        let baseInterval: TimeInterval
        switch confidence {
        case .guess:
            baseInterval = 12 * 60 * 60 // 12 hours
        case .low:
            baseInterval = 24 * 60 * 60 // 1 day
        case .medium:
            baseInterval = 3 * 24 * 60 * 60 // 3 days
        case .high:
            baseInterval = 7 * 24 * 60 * 60 // 1 week
        case .none:
            baseInterval = 2 * 24 * 60 * 60 // default 2 days
        }
        // Scale interval modestly with performance (more correct answers => longer interval).
        let performanceRatio = Double(correctCount) / Double(max(1, reviewCount))
        let scaling = 1.0 + min(2.0, performanceRatio) // cap growth
        dueDate = baseDate.addingTimeInterval(baseInterval * scaling)
    }
}

extension QuestionStudyState {
    var needsReview: Bool {
        if flagged { return true }
        if reviewCount == 0 { return true }
        guard let dueDate else { return false }
        return dueDate <= Date()
    }

    var dueAt: Date? {
        dueDate
    }
}
