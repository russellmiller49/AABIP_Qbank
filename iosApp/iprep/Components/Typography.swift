import SwiftUI

enum Typography {
    static func heading(size: Font.TextStyle = .title2) -> Font {
        Font.system(size, design: .rounded).weight(.semibold)
    }

    static func bodyEmphasis() -> Font {
        Font.system(.body, design: .default).weight(.medium)
    }

    static func caption() -> Font {
        Font.system(.caption, design: .default)
    }
}
