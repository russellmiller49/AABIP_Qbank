import SwiftUI
import Shared

struct LeaderboardView: View {
    @EnvironmentObject private var environment: AppEnvironment
    @State private var isOptedIn: Bool = false
    @State private var alias: String = ""

    private var snapshot: LeaderboardSnapshot? {
        environment.leaderboardSnapshot()
    }

    var body: some View {
        List {
            Section(header: Text("Participation")) {
                Toggle(isOn: $isOptedIn) {
                    Label("Opt into weekly leaderboards", systemImage: "trophy")
                }
                .toggleStyle(SwitchToggleStyle(tint: Color.ipAccent))

                VStack(alignment: .leading, spacing: 12) {
                    Text("Choose the display name shown on the leaderboard.")
                        .font(.footnote.weight(.semibold))
                    TextField("Display name", text: $alias)
                        .textInputAutocapitalization(.words)
                        .disableAutocorrection(true)
                        .disabled(!isOptedIn)
                        .padding(10)
                        .background(
                            RoundedRectangle(cornerRadius: 12, style: .continuous)
                                .fill(Color.ipSurface)
                        )
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("We use a pseudonymous ID and aggregate data only. No personal identifiers are shared.")
                        .font(.footnote)
                        .foregroundStyle(Color.secondary)
                }
                .listRowBackground(Color.clear)
            }

            if isOptedIn {
                resultsSection
            } else {
                Section {
                    ContentUnavailableView(
                        "Leaderboards disabled",
                        systemImage: "lock.slash",
                        description: Text("Enable the toggle above to see your weekly percentile by domain."))
                        .frame(maxWidth: .infinity, alignment: .center)
                        .listRowInsets(EdgeInsets())
                }
            }
        }
        .listStyle(.insetGrouped)
        .background(Color.ipBackground.ignoresSafeArea())
        .navigationTitle("Leaderboards")
        .onAppear {
            isOptedIn = environment.leaderboardOptIn()
            alias = environment.leaderboardAlias()
        }
        .onChange(of: isOptedIn) { _, newValue in
            environment.setLeaderboardOptIn(newValue)
            if newValue {
                alias = environment.leaderboardAlias()
            }
        }
        .onChange(of: alias) { oldValue, newValue in
            guard isOptedIn, newValue != oldValue else { return }
            environment.setLeaderboardAlias(newValue)
            let stored = environment.leaderboardAlias()
            if stored != newValue {
                alias = stored
            }
        }
    }

    private var resultsSection: some View {
        Section(header: resultsHeader) {
            if let snapshot, !snapshot.domains.isEmpty {
                ForEach(snapshot.domains) { domain in
                    LeaderboardRow(domain: domain)
                        .listRowBackground(Color.ipSurface)
                }
            } else {
                ContentUnavailableView(
                    "No data yet",
                    systemImage: "chart.line.uptrend.xyaxis",
                    description: Text("Complete a quiz to start building your leaderboard stats."))
                    .frame(maxWidth: .infinity, alignment: .center)
                    .listRowInsets(EdgeInsets())
            }
        }
    }

    private var resultsHeader: some View {
        HStack {
            Text("Weekly percentiles")
            Spacer()
            if let snapshot {
                VStack(alignment: .trailing, spacing: 2) {
                    Text(snapshot.alias)
                        .font(.footnote.weight(.semibold))
                    Text("ID: \(snapshot.participantID.prefix(8))…")
                        .font(.caption.monospacedDigit())
                        .foregroundStyle(Color.secondary)
                }
            }
        }
    }
}

private struct LeaderboardRow: View {
    let domain: LeaderboardSnapshot.DomainScore

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Text(domain.title)
                    .font(.headline)
                Spacer()
                Text("\(Int(domain.percentile * 100))th")
                    .font(.caption.weight(.semibold))
                    .padding(.horizontal, 10)
                    .padding(.vertical, 4)
                    .background(Capsule().fill(Color.ipAccent.opacity(0.18)))
            }
            ProgressView(value: domain.accuracy, total: 1.0) {
                Text("Accuracy")
                    .font(.caption)
                    .foregroundStyle(Color.secondary)
            }
            .tint(Color.ipAccent)
        }
        .padding(.vertical, 10)
    }
}

#Preview {
    NavigationStack {
        LeaderboardView()
            .environmentObject(AppEnvironment.shared)
    }
}
