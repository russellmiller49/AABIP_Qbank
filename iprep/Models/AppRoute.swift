import Foundation

public enum AppRoute: Hashable {
    case dashboard
    case quiz(resume: Bool)
    case review
    case analytics
    case settings
}
