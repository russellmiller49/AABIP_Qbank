import Foundation
import Shared

typealias Module = Shared.Module

extension Module: Identifiable {}

extension Module.Difficulty {
    static var allCases: [Module.Difficulty] {
        entries
    }

    var rawValue: String {
        value
    }

    static func from(rawValue: String) -> Module.Difficulty? {
        let normalized = rawValue.lowercased()
        if normalized == Module.Difficulty.easy.value { return .easy }
        if normalized == Module.Difficulty.moderate.value { return .moderate }
        if normalized == Module.Difficulty.hard.value { return .hard }
        return nil
    }
}
