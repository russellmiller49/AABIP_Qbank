import SwiftUI
import Shared

struct DuelView: View {
    @Environment(\.dismiss) private var dismiss

    let enemyId: String

    @StateObject private var viewModel: DuelViewModel
    @State private var battleEvent: BattleEvent?

    init(enemyId: String, engine: Shared.DuelEngineService, store: DuelStore) {
        self.enemyId = enemyId
        _viewModel = StateObject(wrappedValue: DuelViewModel(engine: engine, store: store))
    }

    var body: some View {
        let duel = viewModel.state
        let enemy = duel?.enemy ?? Shared.EnemyDefinitions.shared.enemy(id: enemyId)

        VStack(spacing: 0) {
            if let duel, let enemy {
                DuelArenaView(duel: duel, enemy: enemy, battleEvent: $battleEvent)
            } else {
                ZStack {
                    if let enemy {
                        LinearGradient(
                            colors: [Color(hex: enemy.themeColor).opacity(0.3), Color.black.opacity(0.8)],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    } else {
                        Color.black.opacity(0.8)
                    }

                    ProgressView("Preparing duel…")
                        .foregroundStyle(.white)
                }
                .frame(height: 300)
            }

            Divider()

            Group {
                switch duel?.phase {
                case .intro:
                    intro(enemy: enemy)
                case .question:
                    question(duel: duel)
                case .feedback:
                    feedback(duel: duel)
                case .end:
                    end(duel: duel, enemy: enemy)
                default:
                    ProgressView("Preparing duel…")
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color(.systemGroupedBackground))
        }
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            // Start the duel when we enter the screen (idempotent for the current enemy).
            if viewModel.state?.enemyId != enemyId {
                viewModel.startDuel(enemyId: enemyId)
            }
        }
        .onChange(of: viewModel.state?.lastAnswer?.questionId) { _, _ in
            guard let duel = viewModel.state, let result = duel.lastAnswer else {
                battleEvent = nil
                return
            }

            guard result.questionId == duel.currentQuestion?.id else { return }
            triggerBattleSequence(result: result)
        }
    }

    private func intro(enemy: Shared.Enemy?) -> some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                if let enemy {
                    VStack(alignment: .leading, spacing: 8) {
                        Text(enemy.displayName)
                            .font(.title.weight(.bold))
                        Text(enemy.description_)
                            .font(.body)
                            .foregroundStyle(.secondary)
                    }
                    .padding(.bottom, 8)

                    DuelStatsRow(enemy: enemy)
                }

                Button {
                    viewModel.proceedToQuestion()
                } label: {
                    Text("Begin Duel")
                        .frame(maxWidth: .infinity)
                }
                .buttonStyle(KenneyButtonStyle(variant: .primary))
            }
            .padding(16)
        }
    }

    private func question(duel: Shared.DuelState?) -> some View {
        guard let duel, let question = duel.currentQuestion else {
            return AnyView(
                VStack(spacing: 12) {
                    Text("No questions available")
                        .font(.headline)
                    Button("End Duel") {
                        viewModel.endDuel()
                        dismiss()
                    }
                    .buttonStyle(.bordered)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            )
        }

        return AnyView(
            VStack(spacing: 12) {
                HStack(spacing: 10) {
                    HStack(spacing: 6) {
                        KenneyImage(id: "icon.status.streak")
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 16, height: 16)
                        Text("Streak \(duel.currentStreak)")
                    }
                    .font(.caption.weight(.semibold))
                    .foregroundStyle(.secondary)
                    Spacer()
                    Text("XP \(duel.xpEarned)")
                        .font(.caption.weight(.semibold))
                        .foregroundStyle(.secondary)
                }
                .padding(.horizontal, 12)

                if duel.xpEarned > 0 {
                    XPRewardBar(xp: Int(duel.xpEarned))
                        .padding(.horizontal, 12)
                        .transition(.opacity)
                }

                DuelQuestionCard(
                    question: question,
                    showingHint: duel.showingHint,
                    isResolving: viewModel.isResolving
                )
                    .padding(.horizontal, 12)
                    .id(question.id)

                DuelLifelinesRow(
                    lifelines: duel.lifelines,
                    showingHint: duel.showingHint,
                    onHint: { viewModel.useHint() },
                    onShield: { viewModel.useShield() },
                    onDoubleTap: { viewModel.useDoubleTap() }
                )
                .padding(.horizontal, 12)

                HStack(spacing: 12) {
                    Button {
                        viewModel.submitAnswer(true)
                    } label: {
                        MoveButtonLabel(
                            iconId: "icon.status.correct",
                            title: "Treat",
                            subtitle: "Commit",
                            foreground: Color.black.opacity(0.92),
                            subtitleForeground: Color.black.opacity(0.62)
                        )
                    }
                    .buttonStyle(KenneyButtonStyle(variant: .primary, size: .compact))
                    .disabled(viewModel.isResolving)

                    Button {
                        viewModel.submitAnswer(false)
                    } label: {
                        MoveButtonLabel(
                            iconId: "icon.status.wrong",
                            title: "Reject",
                            subtitle: "Dismiss",
                            foreground: Color.white,
                            subtitleForeground: Color.white.opacity(0.85)
                        )
                    }
                    .buttonStyle(KenneyButtonStyle(variant: .secondary, size: .compact))
                    .disabled(viewModel.isResolving)
                }
                .padding(.horizontal, 12)

                if viewModel.isResolving {
                    ProgressView()
                        .padding(.top, 4)
                        .transition(.opacity)
                }

                Spacer(minLength: 0)
            }
        )
    }

    private func feedback(duel: Shared.DuelState?) -> some View {
        guard let duel, let question = duel.currentQuestion, let last = duel.lastAnswer else {
            return AnyView(EmptyView())
        }

        return AnyView(
            ScrollView {
                VStack(spacing: 16) {
                    DuelFeedbackCard(question: question, last: last)
                        .padding(.horizontal, 16)

                    Button {
                        viewModel.proceedAfterFeedback()
                    } label: {
                        Text("Next Question")
                            .frame(maxWidth: .infinity)
                    }
                    .buttonStyle(KenneyButtonStyle(variant: .primary))
                    .padding(.horizontal, 16)
                    .padding(.top, 4)
                }
                .padding(.vertical, 16)
            }
        )
    }

    private func end(duel: Shared.DuelState?, enemy: Shared.Enemy?) -> some View {
        guard let duel else { return AnyView(EmptyView()) }

        return AnyView(
            VStack(spacing: 16) {
                Spacer()

                if duel.isPlayerVictory {
                    Text("Victory!")
                        .font(.largeTitle.weight(.bold))
                    Text("You defeated \(enemy?.name ?? "your opponent").")
                        .foregroundStyle(.secondary)
                } else {
                    Text("Defeat")
                        .font(.largeTitle.weight(.bold))
                    Text("Regroup and try again.")
                        .foregroundStyle(.secondary)
                }

                VStack(spacing: 8) {
                    StatLine(label: "XP Earned", value: "\(duel.xpEarned)")
                    StatLine(label: "Correct", value: "\(duel.correctCount)")
                    StatLine(label: "Incorrect", value: "\(duel.incorrectCount)")
                    StatLine(label: "Max Streak", value: "\(duel.maxStreak)")
                }
                .padding(14)
                .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 16, style: .continuous))

                Button {
                    viewModel.endDuel()
                    dismiss()
                } label: {
                    Text("Done")
                        .frame(maxWidth: .infinity)
                }
                .buttonStyle(KenneyButtonStyle(variant: .primary))

                Spacer()
            }
            .padding(16)
        )
    }

    private func triggerBattleSequence(result: Shared.AnswerResult) {
        if result.isCorrect {
            withAnimation {
                battleEvent = .playerAttack
            }

            DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
                withAnimation {
                    battleEvent = .enemyHit(damage: Int(result.damageDealt), isCrit: result.wasCrit)
                }
            }
        } else {
            withAnimation {
                battleEvent = .enemyAttack
            }

            DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
                withAnimation {
                    battleEvent = .playerHit(damage: Int(result.damageTaken))
                }
            }
        }

        DispatchQueue.main.asyncAfter(deadline: .now() + 1.4) {
            battleEvent = nil
        }
    }
}

private struct DuelStatsRow: View {
    let enemy: Shared.Enemy

    var body: some View {
        HStack(spacing: 12) {
            StatPill(label: "Max HP", value: "\(enemy.maxHP)", systemImage: "heart.fill", tint: .red)
            StatPill(label: "Bias", value: "\(enemy.topicBiases.count)", systemImage: "scope", tint: .orange)
        }
    }
}

private struct DuelQuestionCard: View {
    let question: Shared.DuelQuestion
    let showingHint: Bool
    let isResolving: Bool

    @State private var appeared: Bool = false
    @State private var expanded: Bool = false
    @Environment(\.horizontalSizeClass) private var horizontalSizeClass

    var body: some View {
        let isPhone = horizontalSizeClass == .compact
        let isVeryLong = question.statement.count > 220
        let statementFont: Font = isVeryLong ? .subheadline.weight(.semibold) : .callout.weight(.semibold)
        let statementHeight: CGFloat = expanded ? (isPhone ? 320 : 380) : (isPhone ? 210 : 240)

        VStack(alignment: .leading, spacing: 10) {
            TopicPill(text: question.topic)

            ScrollView {
                Text(question.statement)
                    .font(statementFont)
                    .foregroundStyle(Color.black.opacity(0.92))
                    .lineSpacing(2)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .fixedSize(horizontal: false, vertical: true)
                    .padding(.bottom, 2)
            }
            .scrollIndicators(.hidden)
            .frame(height: statementHeight)
            .animation(.easeInOut(duration: 0.15), value: expanded)

            if showingHint {
                Text(question.hint)
                    .font(.footnote)
                    .foregroundStyle(Color.black.opacity(0.72))
                    .padding(10)
                    .background(Color.yellow.opacity(0.12), in: RoundedRectangle(cornerRadius: 12, style: .continuous))
            }

            HStack {
                Spacer()
                Button {
                    withAnimation(.spring(response: 0.35, dampingFraction: 0.9)) {
                        expanded.toggle()
                    }
                } label: {
                    Text(expanded ? "Collapse" : "More")
                        .font(.caption2.weight(.bold))
                        .foregroundStyle(Color.black.opacity(0.7))
                        .padding(.horizontal, 10)
                        .padding(.vertical, 6)
                        .background(Color.black.opacity(0.08), in: Capsule(style: .continuous))
                }
                .buttonStyle(.plain)
            }
        }
        .padding(16)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background {
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .fill(Color.white.opacity(0.94))
            KenneyImage(
                id: "ui.panel.dialog",
                capInsets: EdgeInsets(top: 24, leading: 24, bottom: 24, trailing: 24),
                resizingMode: .stretch
            )
        }
        .shadow(color: .black.opacity(0.15), radius: 10, y: 6)
        .overlay(alignment: .topTrailing) {
            if isResolving {
                CastingBadge()
                    .padding(10)
                    .transition(.opacity)
            }
        }
        .scaleEffect(appeared ? 1.0 : 0.95)
        .offset(y: appeared ? 0 : 18)
        .opacity(appeared ? 1.0 : 0.0)
        .onAppear {
            appeared = false
            expanded = false
            withAnimation(.spring(response: 0.45, dampingFraction: 0.86)) {
                appeared = true
            }
        }
    }
}

private struct TopicPill: View {
    let text: String

    var body: some View {
        Text(text)
            .font(.caption2.weight(.bold))
            .foregroundStyle(Color.black.opacity(0.6))
            .lineLimit(1)
            .minimumScaleFactor(0.85)
            .padding(.horizontal, 10)
            .padding(.vertical, 6)
            .background(Color.black.opacity(0.06), in: Capsule(style: .continuous))
    }
}

private struct DuelFeedbackCard: View {
    let question: Shared.DuelQuestion
    let last: Shared.AnswerResult

    @State private var appeared: Bool = false
    @State private var expanded: Bool = false

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                ResultBadge(isCorrect: last.isCorrect, wasCrit: last.wasCrit)
                Spacer()
            }

            TopicPill(text: question.topic)

            Text(question.explanation)
                .font(.callout)
                .foregroundStyle(Color.black.opacity(0.92))
                .lineSpacing(2)
                .lineLimit(expanded ? nil : 6)

            if !expanded {
                Text("Tap to expand")
                    .font(.caption2.weight(.semibold))
                    .foregroundStyle(Color.black.opacity(0.6))
            }

            if !question.source.isEmpty {
                Text("Source: \(question.source)")
                    .font(.caption)
                    .foregroundStyle(Color.black.opacity(0.55))
            }
        }
        .padding(16)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background {
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .fill(Color.white.opacity(0.94))
            KenneyImage(
                id: "ui.panel.dialog",
                capInsets: EdgeInsets(top: 24, leading: 24, bottom: 24, trailing: 24),
                resizingMode: .stretch
            )
        }
        .shadow(color: .black.opacity(0.15), radius: 10, y: 6)
        .rotation3DEffect(.degrees(appeared ? 0 : 90), axis: (x: 0, y: 1, z: 0))
        .opacity(appeared ? 1 : 0)
        .onAppear {
            appeared = false
            expanded = false
            withAnimation(.spring(response: 0.55, dampingFraction: 0.86)) {
                appeared = true
            }
        }
        .onTapGesture {
            expanded.toggle()
        }
    }
}

private struct ResultBadge: View {
    let isCorrect: Bool
    let wasCrit: Bool

    var body: some View {
        HStack(spacing: 8) {
            KenneyImage(id: isCorrect ? "icon.status.correct" : "icon.status.wrong", template: true)
                .aspectRatio(contentMode: .fit)
                .frame(width: 18, height: 18)
                .foregroundStyle(.white)

            Text(isCorrect ? "Correct" : "Incorrect")
                .font(.caption.weight(.bold))

            if wasCrit {
                Text("CRIT")
                    .font(.caption2.weight(.bold))
                    .padding(.horizontal, 6)
                    .padding(.vertical, 3)
                    .background(Color.black.opacity(0.18), in: Capsule(style: .continuous))
            }
        }
        .foregroundStyle(.white)
        .padding(.horizontal, 10)
        .padding(.vertical, 7)
        .background(
            (isCorrect ? Color.green.opacity(0.55) : Color.red.opacity(0.55)),
            in: Capsule(style: .continuous)
        )
        .shadow(color: .black.opacity(0.2), radius: 8, y: 4)
    }
}

private struct CastingBadge: View {
    @State private var pulse: Bool = false

    var body: some View {
        HStack(spacing: 6) {
            ProgressView()
                .tint(.white)
                .scaleEffect(0.85)
            Text("Casting")
                .font(.caption.weight(.bold))
        }
        .foregroundStyle(.white)
        .padding(.horizontal, 10)
        .padding(.vertical, 6)
        .background(Color.black.opacity(0.35), in: Capsule(style: .continuous))
        .shadow(color: .black.opacity(0.2), radius: 8, y: 4)
        .opacity(pulse ? 1.0 : 0.75)
        .onAppear {
            withAnimation(.easeInOut(duration: 0.9).repeatForever(autoreverses: true)) {
                pulse = true
            }
        }
    }
}

private struct MoveButtonLabel: View {
    let iconId: String
    let title: String
    let subtitle: String
    let foreground: Color
    let subtitleForeground: Color

    var body: some View {
        HStack(spacing: 8) {
            KenneyImage(id: iconId, template: true)
                .aspectRatio(contentMode: .fit)
                .frame(width: 20, height: 20)
                .foregroundStyle(foreground)

            VStack(alignment: .leading, spacing: 2) {
                Text(title)
                    .font(.subheadline.weight(.bold))
                Text(subtitle)
                    .font(.caption2.weight(.semibold))
                    .foregroundStyle(subtitleForeground)
            }

            Spacer(minLength: 0)
        }
        .frame(maxWidth: .infinity)
    }
}

private struct XPRewardBar: View {
    let xp: Int
    @State private var displayedXP: Int = 0

    private var progress: Double {
        guard xp > 0 else { return 0 }
        return min(Double(xp).truncatingRemainder(dividingBy: 100) / 100.0, 1.0)
    }

    var body: some View {
        VStack(spacing: 6) {
            HStack {
                Text("XP")
                    .font(.caption.weight(.bold))
                    .foregroundStyle(.secondary)
                Spacer()
                Text("+\(xp)")
                    .font(.caption.weight(.bold))
                    .foregroundStyle(.secondary)
            }

            ZStack(alignment: .leading) {
                Capsule().fill(Color.black.opacity(0.12))
                Capsule()
                    .fill(LinearGradient(colors: [.yellow, .orange], startPoint: .leading, endPoint: .trailing))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .scaleEffect(x: progress, y: 1, anchor: .leading)
                    .animation(.spring(response: 0.4, dampingFraction: 0.9), value: xp)
            }
            .frame(height: 10)
        }
        .onAppear { displayedXP = xp }
    }
}

private struct DuelLifelinesRow: View {
    let lifelines: Shared.LifelineState
    let showingHint: Bool
    let onHint: () -> Void
    let onShield: () -> Void
    let onDoubleTap: () -> Void

    var body: some View {
        HStack(spacing: 10) {
            LifelineRune(
                title: "Hint",
                enabled: !lifelines.hintUsed,
                active: showingHint,
                icon: .system("lightbulb.fill"),
                onTap: onHint
            )

            LifelineRune(
                title: "Shield",
                enabled: !lifelines.shieldUsed,
                active: lifelines.shieldActive,
                icon: .kenney("icon.buff.shield"),
                onTap: onShield
            )

            LifelineRune(
                title: "Double",
                enabled: !lifelines.doubleTapUsed,
                active: lifelines.doubleTapActive,
                icon: .system("bolt.fill"),
                onTap: onDoubleTap
            )
        }
    }
}

private struct LifelineRune: View {
    enum Icon {
        case system(String)
        case kenney(String)
    }

    let title: String
    let enabled: Bool
    let active: Bool
    let icon: Icon
    let onTap: () -> Void

    @State private var pulse: Bool = false

    var body: some View {
        Button(action: onTap) {
            VStack(spacing: 4) {
                ZStack {
                    Circle()
                        .strokeBorder(Color.white.opacity(enabled ? 0.45 : 0.18), lineWidth: 2)
                        .opacity(pulse && enabled ? 1.0 : 0.65)
                        .scaleEffect(pulse && enabled ? 1.02 : 0.98)

                    Circle()
                        .trim(from: 0, to: enabled ? 1 : 0.25)
                        .stroke(Color.white.opacity(enabled ? 0.55 : 0.22), style: StrokeStyle(lineWidth: 3, lineCap: .round))
                        .rotationEffect(.degrees(-90))

                    iconView
                        .font(.system(size: 16, weight: .bold))
                        .foregroundStyle(.white)
                        .opacity(enabled ? 1.0 : 0.5)
                }
                .frame(width: 40, height: 40)
                .background(Color.black.opacity(0.20), in: Circle())
                .overlay {
                    if active {
                        Circle()
                            .strokeBorder(Color.yellow.opacity(0.65), lineWidth: 2)
                            .blur(radius: 0.4)
                    }
                }

                Text(title)
                    .font(.caption2.weight(.bold))
                    .foregroundStyle(.secondary)
            }
            .frame(maxWidth: .infinity)
            .padding(.vertical, 4)
            .background(.thinMaterial, in: RoundedRectangle(cornerRadius: 14, style: .continuous))
            .shadow(color: .black.opacity(0.08), radius: 6, y: 3)
        }
        .buttonStyle(.plain)
        .disabled(!enabled)
        .opacity(enabled ? 1 : 0.55)
        .onAppear {
            if enabled {
                withAnimation(.easeInOut(duration: 1.2).repeatForever(autoreverses: true)) {
                    pulse = true
                }
            }
        }
    }

    @ViewBuilder
    private var iconView: some View {
        switch icon {
        case let .system(name):
            Image(systemName: name)
        case let .kenney(id):
            KenneyImage(id: id, template: true)
        }
    }
}

private struct StatPill: View {
    let label: String
    let value: String
    let systemImage: String
    let tint: Color

    var body: some View {
        HStack(spacing: 8) {
            Image(systemName: systemImage)
                .foregroundStyle(tint)
            VStack(alignment: .leading, spacing: 0) {
                Text(label)
                    .font(.caption2)
                    .foregroundStyle(.secondary)
                Text(value)
                    .font(.subheadline.weight(.semibold))
            }
            Spacer(minLength: 0)
        }
        .padding(12)
        .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 14, style: .continuous))
    }
}

private struct StatLine: View {
    let label: String
    let value: String

    var body: some View {
        HStack {
            Text(label)
                .foregroundStyle(.secondary)
            Spacer()
            Text(value)
                .font(.body.weight(.semibold))
        }
        .font(.subheadline)
    }
}
