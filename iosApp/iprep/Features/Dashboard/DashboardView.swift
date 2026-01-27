import SwiftUI
import Shared

public struct DashboardView: View {
    @EnvironmentObject private var environment: AppEnvironment
    @State private var modules: [Module] = []
    @State private var snapshot: DashboardSnapshot = DashboardSnapshot(
        streakCount: 0,
        correctRate: 0.0,
        recentActivityDescription: "Loading..."
    )
    @State private var downloadAlert: DownloadAlert?
    private let navigate: (AppRoute) -> Void

    public init(navigate: @escaping (AppRoute) -> Void = { _ in }) {
        self.navigate = navigate
    }

    private var columns: [GridItem] {
        [GridItem(.adaptive(minimum: 260), spacing: 20)]
    }

    private var hasActiveQuiz: Bool {
        environment.activeQuizSession != nil
    }

    public var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 24) {
                header
                performance
                moduleGrid
                Divider()
                featureLinks
            }
            .padding(.vertical, 32)
            .padding(.horizontal, 20)
        }
        .background(Color.ipBackground.ignoresSafeArea())
        .navigationTitle("Dashboard")
#if os(iOS)
        .navigationBarTitleDisplayMode(.large)
#endif
        .dynamicTypeSize(.medium ... .accessibility3)
        .task {
            await loadContent()
        }
        .alert(item: $downloadAlert) { alert in
            Alert(
                title: Text("Download Complete"),
                message: Text(alert.message),
                dismissButton: .default(Text("OK"))
            )
        }
        .onAppear {
            if modules.isEmpty {
                modules = environment.questionBankService.moduleSummaries()
            }
            if snapshot.recentActivityDescription == "Loading..." {
                let moduleCount = environment.questionBankService.moduleCount()
                let questionCount = environment.questionBankService.totalQuestionCount
                let estimatedMinutes = modules.reduce(0) { $0 + Int($1.estimatedTimeMinutes) }
                snapshot = DashboardSnapshot(
                    streakCount: max(3, moduleCount + 1),
                    correctRate: 0.78,
                    recentActivityDescription: "\(moduleCount) modules • \(questionCount) questions • ~\(estimatedMinutes) min of content"
                )
            }
        }
    }

    private var header: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Ready to keep practicing?")
                .font(Typography.heading())
                .foregroundStyle(Color.primary)

            HStack(spacing: 14) {
                Button(action: startQuickQuiz) {
                    Label("Quick Start", systemImage: "bolt.fill")
                        .font(Typography.bodyEmphasis())
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 12)
                }
                .buttonStyle(.borderedProminent)
                .tint(Color.ipAccent)
                .accessibilityLabel(Text("Start quick quiz"))
                .accessibilityHint(Text("Opens a new mixed-topic quiz"))

                Button(action: continueQuiz) {
                    Label("Continue Quiz", systemImage: "play.circle")
                        .font(Typography.bodyEmphasis())
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 12)
                }
                .buttonStyle(.bordered)
                .tint(Color.ipMutedAccent)
                .disabled(!hasActiveQuiz)
                .opacity(hasActiveQuiz ? 1 : 0.6)
                .accessibilityLabel(Text("Continue saved quiz"))
                .accessibilityHint(Text(hasActiveQuiz ? "Resume your in-progress quiz" : "No quiz in progress"))
            }
        }
    }

    private var performance: some View {
        Button {
            navigate(.analytics)
        } label: {
            VStack(alignment: .leading, spacing: 12) {
                HStack(alignment: .firstTextBaseline) {
                    Text("Performance Snapshot")
                        .font(Typography.heading(size: .title3))
                    Spacer()
                    Image(systemName: "chevron.right")
                        .font(.subheadline.weight(.semibold))
                        .foregroundStyle(Color.secondary)
                }
                HStack(alignment: .top, spacing: 20) {
                    MetricTile(title: "Correct", value: snapshot.correctRate, format: .percent)
                    MetricTile(title: "Streak", value: Double(snapshot.streakCount), format: .integer)
                }
                Text(snapshot.recentActivityDescription)
                    .font(.footnote)
                    .foregroundStyle(Color.secondary)
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(Color.ipSurface)
            .clipShape(RoundedRectangle(cornerRadius: 18, style: .continuous))
            .shadow(color: Color.black.opacity(0.05), radius: 12, y: 8)
        }
        .buttonStyle(.plain)
        .accessibilityHint(Text("Opens analytics overview"))
    }

    private var moduleGrid: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Modules")
                .font(Typography.heading(size: .title3))
            if modules.isEmpty {
                Text("Question bank is warming up…")
                    .font(.callout)
                    .foregroundStyle(Color.secondary)
                    .frame(maxWidth: .infinity, alignment: .center)
                    .padding(.vertical, 32)
            } else {
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(modules) { module in
                        ModuleCard(
                            module: module,
                            isDownloaded: environment.downloadedModuleIDs.contains(module.id)
                        ) {
                            handleDownload(for: module)
                        }
                        .accessibilityElement(children: .contain)
                    }
                }
            }
        }
    }

    private var featureLinks: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("More")
                .font(Typography.heading(size: .title3))
            VStack(alignment: .leading, spacing: 12) {
                Button {
                    navigate(.review)
                } label: {
                    Label("Review", systemImage: "bookmark")
                        .font(.body)
                }
                Button {
                    navigate(.analytics)
                } label: {
                    Label("Analytics", systemImage: "chart.line.uptrend.xyaxis")
                        .font(.body)
                }
                Button {
                    navigate(.settings)
                } label: {
                    Label("Settings", systemImage: "gearshape")
                        .font(.body)
                }
            }
            .buttonStyle(.plain)
        }
    }

    private func startQuickQuiz() {
        navigate(.quiz(.quickStart(resume: false)))
    }

    private func continueQuiz() {
        guard hasActiveQuiz else {
            startQuickQuiz()
            return
        }
        navigate(.quiz(.quickStart(resume: true)))
    }

    private func loadContent() async {
        async let modulesTask = environment.firestoreService.fetchModules()
        async let snapshotTask = environment.firestoreService.fetchDashboardSnapshot()

        if let fetchedModules = try? await modulesTask {
            modules = fetchedModules
        }
        if let fetchedSnapshot = try? await snapshotTask {
            snapshot = fetchedSnapshot
        }
    }

    private func handleDownload(for module: Module) {
        if environment.downloadedModuleIDs.contains(module.id) {
            downloadAlert = DownloadAlert(message: "\(module.title) is already available offline.")
            return
        }
        environment.markModuleDownloaded(module.id)
        downloadAlert = DownloadAlert(message: "\(module.title) questions are now available offline.")
    }
}

private struct DownloadAlert: Identifiable {
    let id = UUID()
    let message: String
}

private struct MetricTile: View {
    enum MetricFormat {
        case percent
        case integer
    }

    let title: String
    let value: Double
    let format: MetricFormat

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(formattedValue)
                .font(Typography.heading(size: .title))
            Text(title.uppercased())
                .font(.caption)
                .foregroundStyle(Color.secondary)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
        .background(Color.ipSurfaceElevated)
        .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
        .accessibilityElement(children: .combine)
        .accessibilityLabel(Text("\(title) \(formattedValue)"))
    }

    private var formattedValue: String {
        switch format {
        case .percent:
            value.formatted(.percent.precision(.fractionLength(0)))
        case .integer:
            Int(value).formatted()
        }
    }
}
