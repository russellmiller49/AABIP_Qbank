import Combine
import Foundation

@MainActor
final class FeatureFlags: ObservableObject {
    @Published private(set) var peerComparisonEnabled: Bool = true
    @Published private(set) var spacedRepetitionEnabled: Bool = true
    @Published private(set) var timedModeEnabled: Bool = false
    @Published private(set) var streaksEnabled: Bool = false
    @Published private(set) var pencilAnnotEnabled: Bool = false
    @Published private(set) var activeReleaseId: String = ""

    private let remoteConfig: RemoteConfigServiceType

    init(remoteConfig: RemoteConfigServiceType) {
        self.remoteConfig = remoteConfig
        applyValues()
    }

    func refresh() async {
        await remoteConfig.refresh()
        await MainActor.run {
            applyValues()
        }
    }

    private func applyValues() {
        peerComparisonEnabled = remoteConfig.boolValue(for: .peerComparisonEnabled)
        spacedRepetitionEnabled = remoteConfig.boolValue(for: .spacedRepetitionEnabled)
        timedModeEnabled = remoteConfig.boolValue(for: .timedModeEnabled)
        streaksEnabled = remoteConfig.boolValue(for: .streaksEnabled)
        pencilAnnotEnabled = remoteConfig.boolValue(for: .pencilAnnotEnabled)
        activeReleaseId = remoteConfig.stringValue(for: .activeReleaseId)
    }
}
