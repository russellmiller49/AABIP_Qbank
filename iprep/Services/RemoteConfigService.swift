import Foundation

protocol RemoteConfigServiceType: AnyObject {
    func boolValue(for key: FeatureFlagKey) -> Bool
    func stringValue(for key: FeatureFlagKey) -> String
    func refresh() async
}

final class RemoteConfigService: RemoteConfigServiceType {
    private let defaults: [FeatureFlagKey: Any]
    private var overrides: [FeatureFlagKey: Any]

    init(defaultsLoader: RemoteConfigDefaultsLoading = RemoteConfigDefaultsLoader()) {
        self.defaults = defaultsLoader.loadDefaults()
        self.overrides = [:]
    }

    func boolValue(for key: FeatureFlagKey) -> Bool {
        readValue(for: key) as? Bool ?? false
    }

    func stringValue(for key: FeatureFlagKey) -> String {
        readValue(for: key) as? String ?? ""
    }

    func refresh() async {
        // Stub: In production this would call Firebase Remote Config.
    }

    private func readValue(for key: FeatureFlagKey) -> Any {
        if let override = overrides[key] {
            return override
        }
        if let defaultValue = defaults[key] {
            return defaultValue
        }
        return false
    }
}

protocol RemoteConfigDefaultsLoading {
    func loadDefaults() -> [FeatureFlagKey: Any]
}

struct RemoteConfigDefaultsLoader: RemoteConfigDefaultsLoading {
    private let resourceName: String
    private let bundle: Bundle

    init(resourceName: String = "RemoteConfigDefaults", bundle: Bundle = .module) {
        self.resourceName = resourceName
        self.bundle = bundle
    }

    func loadDefaults() -> [FeatureFlagKey: Any] {
        guard let url = bundle.url(forResource: resourceName, withExtension: "plist"),
              let data = try? Data(contentsOf: url),
              let plist = try? PropertyListSerialization.propertyList(from: data, format: nil),
              let dictionary = plist as? [String: Any] else {
            return FeatureFlagKey.allCases.reduce(into: [:]) { partialResult, key in
                partialResult[key] = defaultFallback(for: key)
            }
        }

        return dictionary.reduce(into: [:]) { partialResult, element in
            guard let key = FeatureFlagKey(rawValue: element.key) else { return }
            partialResult[key] = element.value
        }
    }

    private func defaultFallback(for key: FeatureFlagKey) -> Any {
        switch key {
        case .peerComparisonEnabled, .spacedRepetitionEnabled:
            return true
        case .timedModeEnabled, .streaksEnabled, .pencilAnnotEnabled:
            return false
        case .activeReleaseId:
            return ""
        }
    }
}
