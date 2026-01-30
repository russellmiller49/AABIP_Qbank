import SwiftUI
import Shared

struct EnemySelectView: View {
    @EnvironmentObject private var duelStore: DuelStore

    let onSelect: (String) -> Void

    private let columns = [
        GridItem(.adaptive(minimum: 160), spacing: 16)
    ]

    var body: some View {
        let profile = duelStore.data.playerProfile
        let enemies = Shared.EnemyDefinitions.shared.allEnemies

        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                header(profile: profile)

                LazyVGrid(columns: columns, spacing: 16) {
                    ForEach(enemies, id: \.id) { enemy in
                        EnemyCard(enemy: enemy, profile: profile) {
                            onSelect(enemy.id)
                        }
                    }
                }
            }
            .padding(16)
        }
        .navigationTitle("Clinical Duel")
        .navigationBarTitleDisplayMode(.inline)
    }

    private func header(profile: Shared.PlayerProfile) -> some View {
        VStack(alignment: .leading, spacing: 6) {
            Text("Choose your opponent")
                .font(.title2.weight(.bold))

            HStack(spacing: 12) {
                Text("Level \(profile.level)")
                    .font(.subheadline.weight(.semibold))
                    .padding(.horizontal, 10)
                    .padding(.vertical, 6)
                    .background(.thinMaterial, in: Capsule())

                ProgressView(value: profile.levelProgress)
                    .tint(.blue)
                    .frame(maxWidth: 220)

                Text("\(profile.xpToNextLevel) XP")
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }
        }
    }
}

private struct EnemyCard: View {
    let enemy: Shared.Enemy
    let profile: Shared.PlayerProfile
    let onTap: () -> Void

    private var isUnlocked: Bool {
        enemy.isUnlocked(profile: profile)
    }

    private var lockReason: String? {
        enemy.lockReason(profile: profile)
    }

    var body: some View {
        Button {
            if isUnlocked { onTap() }
        } label: {
            VStack(alignment: .leading, spacing: 10) {
                HStack(alignment: .center, spacing: 12) {
                    ZStack {
                        Circle()
                            .fill(color(from: enemy.themeColor).opacity(0.16))
                            .frame(width: 44, height: 44)
                        Image(systemName: enemy.iconName)
                            .font(.system(size: 20, weight: .semibold))
                            .foregroundStyle(color(from: enemy.themeColor))
                    }

                    VStack(alignment: .leading, spacing: 2) {
                        Text(enemy.name)
                            .font(.headline)
                        Text(enemy.title)
                            .font(.subheadline)
                            .foregroundStyle(.secondary)
                            .lineLimit(1)
                    }
                    Spacer()
                    if !isUnlocked {
                        Image(systemName: "lock.fill")
                            .foregroundStyle(.secondary)
                    }
                }

                Text(enemy.description_)
                    .font(.footnote)
                    .foregroundStyle(.secondary)
                    .lineLimit(3)

                if let reason = lockReason {
                    Text(reason)
                        .font(.caption.weight(.semibold))
                        .foregroundStyle(.secondary)
                        .padding(.top, 4)
                }
            }
            .padding(14)
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(
                RoundedRectangle(cornerRadius: 18, style: .continuous)
                    .fill(.ultraThinMaterial)
            )
            .overlay(
                RoundedRectangle(cornerRadius: 18, style: .continuous)
                    .stroke(isUnlocked ? color(from: enemy.themeColor).opacity(0.25) : Color.secondary.opacity(0.2), lineWidth: 1)
            )
            .opacity(isUnlocked ? 1 : 0.6)
        }
        .buttonStyle(.plain)
    }

    private func color(from hex: String) -> Color {
        let cleaned = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        guard cleaned.count == 6, let intValue = Int(cleaned, radix: 16) else { return .blue }
        let r = Double((intValue >> 16) & 0xFF) / 255.0
        let g = Double((intValue >> 8) & 0xFF) / 255.0
        let b = Double(intValue & 0xFF) / 255.0
        return Color(red: r, green: g, blue: b)
    }
}

