import SwiftUI

#if canImport(Shared)
import Shared
#endif

/// Entry point view that replicates the original IPREP navigation flow.
struct RootView: View {
    @EnvironmentObject private var environment: AppEnvironment
    @State private var navigationPath: [AppRoute] = []
    @StateObject private var duelStore = DuelStore()

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
                onShowCrosswords: {
                    navigationPath.append(.crosswords)
                },
                onShowLeaderboard: {
                    navigationPath.append(.leaderboard)
                },
                onShowDuel: {
                    navigationPath.append(.duelEnemySelect)
                }
            )
            .environmentObject(environment)
            .environmentObject(duelStore)
            .navigationDestination(for: AppRoute.self) { route in
                switch route {
                case .dashboard:
                    DashboardView { destination in
                        navigationPath.append(destination)
                    }
                    .environmentObject(environment)
                    .environmentObject(duelStore)
                case let .quiz(mode):
                    QuizView(mode: mode)
                        .environmentObject(environment)
                        .environmentObject(duelStore)
                case .progressReport:
                    ProgressReportView()
                        .environmentObject(environment)
                        .environmentObject(duelStore)
                case .review:
                    ReviewView()
                        .environmentObject(environment)
                        .environmentObject(duelStore)
                case .analytics:
                    AnalyticsView()
                        .environmentObject(environment)
                        .environmentObject(duelStore)
                case .settings:
                    SettingsView()
                        .environmentObject(environment)
                        .environmentObject(duelStore)
                case .questionExplorer:
                    QuestionExplorerView()
                        .environmentObject(environment)
                        .environmentObject(duelStore)
                case .leaderboard:
                    LeaderboardView()
                        .environmentObject(environment)
                        .environmentObject(duelStore)
                case .crosswords:
                    CrosswordsView()
                        .environmentObject(environment)
                        .environmentObject(duelStore)
                case let .crossword(puzzleId, title):
                    CrosswordPuzzleView(puzzleId: puzzleId, title: title)
                        .environmentObject(environment)
                        .environmentObject(duelStore)
                case .duelEnemySelect:
                    EnemySelectView { enemyId in
                        navigationPath.append(.duel(enemyId: enemyId))
                    }
                    .environmentObject(environment)
                    .environmentObject(duelStore)
                case let .duel(enemyId):
                    DuelView(enemyId: enemyId, engine: environment.duelEngineCore, store: duelStore)
                        .environmentObject(environment)
                        .environmentObject(duelStore)
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
#if DEBUG && canImport(Shared)
            .overlay(alignment: .bottom) {
                KMPGreetingBanner()
            }
#endif
    }
}

#Preview {
    ContentView()
}

#if canImport(Shared)
private struct KMPGreetingBanner: View {
    private let greeting = Greeter().hello(name: "AABIP")

    var body: some View {
        Text(greeting)
            .font(.footnote)
            .padding(.horizontal, 12)
            .padding(.vertical, 8)
            .frame(maxWidth: .infinity)
            .background(.thinMaterial)
    }
}
#endif
