import Foundation

public enum QuizMode: Hashable {
    case quickStart(resume: Bool)
    case module(id: String, title: String)
    case incorrectOnly
}

public enum AppRoute: Hashable {
    case dashboard
    case quiz(QuizMode)
    case progressReport
    case review
    case analytics
    case settings
}
