import SwiftUI

/// Entry point view that replicates the original IPREP navigation flow.
struct RootView: View {
    @EnvironmentObject private var environment: AppEnvironment
    @State private var navigationPath: [AppRoute] = []

    var body: some View {
        NavigationStack(path: $navigationPath) {
            LandingView(
                onStartPractice: { navigationPath.append(.quiz(resume: false)) },
                onContinueSession: { navigationPath.append(.quiz(resume: true)) },
                onShowProgress: { navigationPath.append(.analytics) },
                onBrowseModules: { navigationPath.append(.dashboard) }
            )
            .environmentObject(environment)
            .navigationDestination(for: AppRoute.self) { route in
                switch route {
                case .dashboard:
                    DashboardView { destination in
                        navigationPath.append(destination)
                    }
                    .environmentObject(environment)
                case let .quiz(resume):
                    QuizView(initialAction: resume ? .resumeIfAvailable : .startFresh)
                        .environmentObject(environment)
                case .review:
                    ReviewView()
                        .environmentObject(environment)
                case .analytics:
                    AnalyticsView()
                        .environmentObject(environment)
                case .settings:
                    SettingsView()
                        .environmentObject(environment)
                }
            }
        }
    }
}

/// Convenience wrapper so previews continue to work with Xcode's template expectation.
struct ContentView: View {
    var body: some View {
        RootView()
            .environmentObject(AppEnvironment.shared)
    }
}

#Preview {
    ContentView()
}
