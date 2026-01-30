import Foundation
import Shared
import SwiftUI
import UIKit

@MainActor
final class KenneyAssets {
    static let shared = KenneyAssets()

    private let registry: Shared.AssetRegistry?
    private var imageCache: [String: UIImage] = [:]

    private init() {
        self.registry = AssetRegistryKt.tryLoadAssetRegistry()
    }

    func resourcePath(for id: String) -> String? {
        registry?.tryPath(id: id)
    }

    func url(for id: String) -> URL? {
        guard let path = resourcePath(for: id) else { return nil }
        return Bundle.main.resourceURL?.appendingPathComponent(path)
    }

    func uiImage(id: String) -> UIImage? {
        if let cached = imageCache[id] { return cached }
        guard let url = url(for: id) else { return nil }
        guard let image = UIImage(contentsOfFile: url.path) else { return nil }
        imageCache[id] = image
        return image
    }
}

struct KenneyImage: View {
    let id: String
    var capInsets: EdgeInsets = .init()
    var resizingMode: Image.ResizingMode = .stretch
    var template: Bool = false

    var body: some View {
        if let uiImage = KenneyAssets.shared.uiImage(id: id) {
            Image(uiImage: uiImage)
                .renderingMode(template ? .template : .original)
                .resizable(capInsets: capInsets, resizingMode: resizingMode)
                .interpolation(.none)
        } else {
            Color.clear
        }
    }
}

struct KenneyButtonStyle: ButtonStyle {
    enum Variant {
        case primary
        case secondary
    }

    enum Size {
        case regular
        case compact
    }

    let variant: Variant
    let size: Size
    @Environment(\.isEnabled) private var isEnabled

    init(variant: Variant, size: Size = .regular) {
        self.variant = variant
        self.size = size
    }

    private var foreground: Color {
        switch variant {
        case .primary:
            return Color.black.opacity(0.92)
        case .secondary:
            return Color.white
        }
    }

    private var verticalPadding: CGFloat {
        switch size {
        case .regular:
            return 14
        case .compact:
            return 10
        }
    }

    private var horizontalPadding: CGFloat {
        switch size {
        case .regular:
            return 18
        case .compact:
            return 14
        }
    }

    private var labelFont: Font {
        switch size {
        case .regular:
            return .headline.weight(.bold)
        case .compact:
            return .subheadline.weight(.bold)
        }
    }

    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(labelFont)
            .foregroundStyle(foreground)
            .shadow(color: Color.black.opacity(variant == .primary ? 0.1 : 0.25), radius: 1, y: 1)
            .padding(.vertical, verticalPadding)
            .padding(.horizontal, horizontalPadding)
            .frame(maxWidth: .infinity)
            .background {
                buttonBackground(isPressed: configuration.isPressed)
            }
            .opacity(isEnabled ? 1.0 : 0.55)
            .scaleEffect(configuration.isPressed ? 0.98 : 1.0)
            .animation(.easeOut(duration: 0.12), value: configuration.isPressed)
    }

    @ViewBuilder
    private func buttonBackground(isPressed: Bool) -> some View {
        let id = variant == .primary ? "ui.button.primary" : "ui.button.secondary"

        if KenneyAssets.shared.uiImage(id: id) != nil {
            KenneyImage(
                id: id,
                capInsets: EdgeInsets(top: 18, leading: 18, bottom: 18, trailing: 18),
                resizingMode: .stretch
            )
            .opacity(isPressed ? 0.9 : 1.0)
        } else {
            RoundedRectangle(cornerRadius: 16, style: .continuous)
                .fill(variant == .primary ? Color(red: 0.22, green: 0.55, blue: 0.95) : Color.gray)
                .opacity(isPressed ? 0.9 : 1.0)
        }
    }
}
