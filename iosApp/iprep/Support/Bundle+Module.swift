import Foundation

extension Bundle {
    /// Replacement for Swift Package Manager's `Bundle.module` so the code
    /// continues to work now that everything lives in the main app target.
    static var module: Bundle { .main }
}
