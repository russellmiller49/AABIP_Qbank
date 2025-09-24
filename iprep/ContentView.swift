import SwiftUI

/// Entry point view that replicates the original IPREP navigation flow.
struct RootView: View {
    @EnvironmentObject private var environment: AppEnvironment
    @State private var navigationPath: [AppRoute] = []

    var body: some View {
        NavigationStack(path: $navigationPath) {
            LandingView(
                onStartPractice: { navigationPath.append(.quiz(.quickStart(resume: false))) },
                onContinueSession: { navigationPath.append(.quiz(.quickStart(resume: true))) },
                onShowProgress: { navigationPath.append(.analytics) },
                onShowDashboard: { navigationPath.append(.dashboard) },
                onSelectModule: { module in
                    navigationPath.append(.quiz(.module(id: module.id, title: module.title)))
                },
                onRetryIncorrect: {
                    navigationPath.append(.quiz(.incorrectOnly))
                },
                onExploreQuestions: {
                    navigationPath.append(.questionExplorer)
                },
                onShowLeaderboard: {
                    navigationPath.append(.leaderboard)
                }
            )
            .environmentObject(environment)
            .navigationDestination(for: AppRoute.self) { route in
                switch route {
                case .dashboard:
                    DashboardView { destination in
                        navigationPath.append(destination)
                    }
                    .environmentObject(environment)
                case let .quiz(mode):
                    QuizView(mode: mode)
                        .environmentObject(environment)
                case .progressReport:
                    ProgressReportView()
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
                case .questionExplorer:
                    QuestionExplorerView()
                        .environmentObject(environment)
                case .leaderboard:
                    LeaderboardView()
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
