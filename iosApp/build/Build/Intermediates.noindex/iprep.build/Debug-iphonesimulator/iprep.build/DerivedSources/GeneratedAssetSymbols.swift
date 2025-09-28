import Foundation
#if canImport(AppKit)
import AppKit
#endif
#if canImport(UIKit)
import UIKit
#endif
#if canImport(SwiftUI)
import SwiftUI
#endif
#if canImport(DeveloperToolsSupport)
import DeveloperToolsSupport
#endif

#if SWIFT_PACKAGE
private let resourceBundle = Foundation.Bundle.module
#else
private class ResourceBundleClass {}
private let resourceBundle = Foundation.Bundle(for: ResourceBundleClass.self)
#endif

// MARK: - Color Symbols -

@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
extension DeveloperToolsSupport.ColorResource {

    /// The "Accent" asset catalog color resource.
    static let accent = DeveloperToolsSupport.ColorResource(name: "Accent", bundle: resourceBundle)

    /// The "Background" asset catalog color resource.
    static let background = DeveloperToolsSupport.ColorResource(name: "Background", bundle: resourceBundle)

    /// The "MutedAccent" asset catalog color resource.
    static let mutedAccent = DeveloperToolsSupport.ColorResource(name: "MutedAccent", bundle: resourceBundle)

    /// The "Surface" asset catalog color resource.
    static let surface = DeveloperToolsSupport.ColorResource(name: "Surface", bundle: resourceBundle)

    /// The "SurfaceElevated" asset catalog color resource.
    static let surfaceElevated = DeveloperToolsSupport.ColorResource(name: "SurfaceElevated", bundle: resourceBundle)

}

// MARK: - Image Symbols -

@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
extension DeveloperToolsSupport.ImageResource {

    /// The "AABIPLogo" asset catalog image resource.
    static let aabipLogo = DeveloperToolsSupport.ImageResource(name: "AABIPLogo", bundle: resourceBundle)

}

// MARK: - Color Symbol Extensions -

#if canImport(AppKit)
@available(macOS 14.0, *)
@available(macCatalyst, unavailable)
extension AppKit.NSColor {

    /// The "Accent" asset catalog color.
    static var accent: AppKit.NSColor {
#if !targetEnvironment(macCatalyst)
        .init(resource: .accent)
#else
        .init()
#endif
    }

    /// The "Background" asset catalog color.
    static var background: AppKit.NSColor {
#if !targetEnvironment(macCatalyst)
        .init(resource: .background)
#else
        .init()
#endif
    }

    /// The "MutedAccent" asset catalog color.
    static var mutedAccent: AppKit.NSColor {
#if !targetEnvironment(macCatalyst)
        .init(resource: .mutedAccent)
#else
        .init()
#endif
    }

    /// The "Surface" asset catalog color.
    static var surface: AppKit.NSColor {
#if !targetEnvironment(macCatalyst)
        .init(resource: .surface)
#else
        .init()
#endif
    }

    /// The "SurfaceElevated" asset catalog color.
    static var surfaceElevated: AppKit.NSColor {
#if !targetEnvironment(macCatalyst)
        .init(resource: .surfaceElevated)
#else
        .init()
#endif
    }

}
#endif

#if canImport(UIKit)
@available(iOS 17.0, tvOS 17.0, *)
@available(watchOS, unavailable)
extension UIKit.UIColor {

    /// The "Accent" asset catalog color.
    static var accent: UIKit.UIColor {
#if !os(watchOS)
        .init(resource: .accent)
#else
        .init()
#endif
    }

    /// The "Background" asset catalog color.
    static var background: UIKit.UIColor {
#if !os(watchOS)
        .init(resource: .background)
#else
        .init()
#endif
    }

    /// The "MutedAccent" asset catalog color.
    static var mutedAccent: UIKit.UIColor {
#if !os(watchOS)
        .init(resource: .mutedAccent)
#else
        .init()
#endif
    }

    /// The "Surface" asset catalog color.
    static var surface: UIKit.UIColor {
#if !os(watchOS)
        .init(resource: .surface)
#else
        .init()
#endif
    }

    /// The "SurfaceElevated" asset catalog color.
    static var surfaceElevated: UIKit.UIColor {
#if !os(watchOS)
        .init(resource: .surfaceElevated)
#else
        .init()
#endif
    }

}
#endif

#if canImport(SwiftUI)
@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
extension SwiftUI.Color {

    /// The "Accent" asset catalog color.
    static var accent: SwiftUI.Color { .init(.accent) }

    /// The "Background" asset catalog color.
    static var background: SwiftUI.Color { .init(.background) }

    /// The "MutedAccent" asset catalog color.
    static var mutedAccent: SwiftUI.Color { .init(.mutedAccent) }

    /// The "Surface" asset catalog color.
    static var surface: SwiftUI.Color { .init(.surface) }

    /// The "SurfaceElevated" asset catalog color.
    static var surfaceElevated: SwiftUI.Color { .init(.surfaceElevated) }

}

@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
extension SwiftUI.ShapeStyle where Self == SwiftUI.Color {

    /// The "Accent" asset catalog color.
    static var accent: SwiftUI.Color { .init(.accent) }

    /// The "Background" asset catalog color.
    static var background: SwiftUI.Color { .init(.background) }

    /// The "MutedAccent" asset catalog color.
    static var mutedAccent: SwiftUI.Color { .init(.mutedAccent) }

    /// The "Surface" asset catalog color.
    static var surface: SwiftUI.Color { .init(.surface) }

    /// The "SurfaceElevated" asset catalog color.
    static var surfaceElevated: SwiftUI.Color { .init(.surfaceElevated) }

}
#endif

// MARK: - Image Symbol Extensions -

#if canImport(AppKit)
@available(macOS 14.0, *)
@available(macCatalyst, unavailable)
extension AppKit.NSImage {

    /// The "AABIPLogo" asset catalog image.
    static var aabipLogo: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .aabipLogo)
#else
        .init()
#endif
    }

}
#endif

#if canImport(UIKit)
@available(iOS 17.0, tvOS 17.0, *)
@available(watchOS, unavailable)
extension UIKit.UIImage {

    /// The "AABIPLogo" asset catalog image.
    static var aabipLogo: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .aabipLogo)
#else
        .init()
#endif
    }

}
#endif

// MARK: - Thinnable Asset Support -

@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
@available(watchOS, unavailable)
extension DeveloperToolsSupport.ColorResource {

    private init?(thinnableName: Swift.String, bundle: Foundation.Bundle) {
#if canImport(AppKit) && os(macOS)
        if AppKit.NSColor(named: NSColor.Name(thinnableName), bundle: bundle) != nil {
            self.init(name: thinnableName, bundle: bundle)
        } else {
            return nil
        }
#elseif canImport(UIKit) && !os(watchOS)
        if UIKit.UIColor(named: thinnableName, in: bundle, compatibleWith: nil) != nil {
            self.init(name: thinnableName, bundle: bundle)
        } else {
            return nil
        }
#else
        return nil
#endif
    }

}

#if canImport(AppKit)
@available(macOS 14.0, *)
@available(macCatalyst, unavailable)
extension AppKit.NSColor {

    private convenience init?(thinnableResource: DeveloperToolsSupport.ColorResource?) {
#if !targetEnvironment(macCatalyst)
        if let resource = thinnableResource {
            self.init(resource: resource)
        } else {
            return nil
        }
#else
        return nil
#endif
    }

}
#endif

#if canImport(UIKit)
@available(iOS 17.0, tvOS 17.0, *)
@available(watchOS, unavailable)
extension UIKit.UIColor {

    private convenience init?(thinnableResource: DeveloperToolsSupport.ColorResource?) {
#if !os(watchOS)
        if let resource = thinnableResource {
            self.init(resource: resource)
        } else {
            return nil
        }
#else
        return nil
#endif
    }

}
#endif

#if canImport(SwiftUI)
@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
extension SwiftUI.Color {

    private init?(thinnableResource: DeveloperToolsSupport.ColorResource?) {
        if let resource = thinnableResource {
            self.init(resource)
        } else {
            return nil
        }
    }

}

@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
extension SwiftUI.ShapeStyle where Self == SwiftUI.Color {

    private init?(thinnableResource: DeveloperToolsSupport.ColorResource?) {
        if let resource = thinnableResource {
            self.init(resource)
        } else {
            return nil
        }
    }

}
#endif

@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
@available(watchOS, unavailable)
extension DeveloperToolsSupport.ImageResource {

    private init?(thinnableName: Swift.String, bundle: Foundation.Bundle) {
#if canImport(AppKit) && os(macOS)
        if bundle.image(forResource: NSImage.Name(thinnableName)) != nil {
            self.init(name: thinnableName, bundle: bundle)
        } else {
            return nil
        }
#elseif canImport(UIKit) && !os(watchOS)
        if UIKit.UIImage(named: thinnableName, in: bundle, compatibleWith: nil) != nil {
            self.init(name: thinnableName, bundle: bundle)
        } else {
            return nil
        }
#else
        return nil
#endif
    }

}

#if canImport(AppKit)
@available(macOS 14.0, *)
@available(macCatalyst, unavailable)
extension AppKit.NSImage {

    private convenience init?(thinnableResource: DeveloperToolsSupport.ImageResource?) {
#if !targetEnvironment(macCatalyst)
        if let resource = thinnableResource {
            self.init(resource: resource)
        } else {
            return nil
        }
#else
        return nil
#endif
    }

}
#endif

#if canImport(UIKit)
@available(iOS 17.0, tvOS 17.0, *)
@available(watchOS, unavailable)
extension UIKit.UIImage {

    private convenience init?(thinnableResource: DeveloperToolsSupport.ImageResource?) {
#if !os(watchOS)
        if let resource = thinnableResource {
            self.init(resource: resource)
        } else {
            return nil
        }
#else
        return nil
#endif
    }

}
#endif

