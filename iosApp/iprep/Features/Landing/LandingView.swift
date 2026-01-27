import SwiftUI
import Shared

struct LandingView: View {
    @EnvironmentObject private var environment: AppEnvironment
    @Environment(\.horizontalSizeClass) private var horizontalSizeClass

    let onStartPractice: () -> Void
    let onContinueSession: () -> Void
    let onShowProgress: () -> Void
    let onShowDashboard: () -> Void
    let onSelectModule: (Module) -> Void
    let onRetryIncorrect: () -> Void
    let onExploreQuestions: () -> Void
    let onShowLeaderboard: () -> Void

    @State private var showModulePicker = false
    @State private var showNoIncorrectAlert = false

    private var hasActiveSession: Bool {
        environment.activeQuizSession != nil
    }

    private var canRetryIncorrect: Bool {
        environment.hasIncorrectQuestions()
    }

    private var isRegularWidth: Bool {
        horizontalSizeClass == .regular
    }

    private var latestSession: CompletedQuizSession? {
        environment.completedQuizSessions.first
    }

    var body: some View {
        GeometryReader { _ in
            ZStack {
                LandingBackground()
                ScrollView(showsIndicators: false) {
                    VStack(spacing: isRegularWidth ? 32 : 24) {
                        Spacer(minLength: isRegularWidth ? 60 : 40)
                        content
                            .padding(.horizontal, isRegularWidth ? 0 : 24)
                        Spacer(minLength: isRegularWidth ? 40 : 20)
                        footer
                            .padding(.bottom, 40)
                    }
                    .frame(maxWidth: .infinity)
                }
            }
            .ignoresSafeArea()
        }
        .sheet(isPresented: $showModulePicker) {
            ModulePickerView(
                modules: environment.questionBankService.moduleSummaries(),
                onSelect: { module in
                    showModulePicker = false
                    onSelectModule(module)
                },
                onCancel: { showModulePicker = false }
            )
        }
        .alert("No incorrect answers yet", isPresented: $showNoIncorrectAlert) {
            Button("OK", role: .cancel) { }
        } message: {
            Text("Complete a quiz first so we can track which questions to retry.")
        }
    }

    private var content: some View {
        Group {
            if isRegularWidth, let session = latestSession {
                HStack(alignment: .center, spacing: 36) {
                    landingCard
                        .frame(maxWidth: 480)
                    LandingProgressSummary(session: session)
                        .frame(maxWidth: 320)
                        .onTapGesture { onShowProgress() }
                }
            } else {
                landingCard
                    .frame(maxWidth: 420)
            }
        }
    }

    private var landingCard: some View {
        VStack(spacing: 24) {
            VStack(spacing: 8) {
                Text("AABIP-IPREP")
                    .font(.system(size: isRegularWidth ? 42 : 36, weight: .bold, design: .rounded))
                    .foregroundStyle(Color.white.opacity(0.95))
                Text("Interventional Pulmonary Exam Prep")
                    .font(.title3.weight(.semibold))
                    .foregroundStyle(Color.white.opacity(0.9))
                    .multilineTextAlignment(.center)
            }

            Image("AABIPLogo", bundle: .module)
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200)
                .clipShape(Circle())
                .shadow(color: Color.black.opacity(0.1), radius: 10, y: 6)

            VStack(spacing: 14) {
                Button(action: onStartPractice) {
                    Text("Start Practice")
                }
                .buttonStyle(LandingButtonStyle(variant: .primary))

                Button(action: onContinueSession) {
                    Text("Continue Last Session")
                }
                .buttonStyle(LandingButtonStyle(variant: .secondary))
                .disabled(!hasActiveSession)
                .opacity(hasActiveSession ? 1 : 0.6)

                Button(action: onShowDashboard) {
                    Text("Dashboard")
                }
                .buttonStyle(LandingButtonStyle(variant: .secondary))

                Button {
                    showModulePicker = true
                } label: {
                    Text("Study by Category")
                }
                .buttonStyle(LandingButtonStyle(variant: .secondary))

                Button(action: onExploreQuestions) {
                    Text("Question Explorer")
                }
                .buttonStyle(LandingButtonStyle(variant: .secondary))

                Button(action: onShowLeaderboard) {
                    Text("Leaderboards")
                }
                .buttonStyle(LandingButtonStyle(variant: .secondary))

                Button {
                    if canRetryIncorrect {
                        onRetryIncorrect()
                    } else {
                        showNoIncorrectAlert = true
                    }
                } label: {
                    Text("Retry Incorrect Questions")
                }
                .buttonStyle(LandingButtonStyle(variant: .secondary))
                .opacity(canRetryIncorrect ? 1 : 0.6)

                Button(action: onShowProgress) {
                    Text("My Progress")
                }
                .buttonStyle(LandingButtonStyle(variant: .secondary))
            }
        }
        .padding(.vertical, isRegularWidth ? 24 : 12)
        .background(
            RoundedRectangle(cornerRadius: isRegularWidth ? 36 : 28, style: .continuous)
                .fill(Color.white.opacity(isRegularWidth ? 0.08 : 0.12))
                .shadow(color: Color.black.opacity(0.12), radius: isRegularWidth ? 28 : 18, y: 24)
        )
        .overlay(
            RoundedRectangle(cornerRadius: isRegularWidth ? 36 : 28, style: .continuous)
                .stroke(Color.white.opacity(0.18), lineWidth: 1)
        )
    }

    private var footer: some View {
        VStack(spacing: 12) {
            if !isRegularWidth, let session = latestSession {
                LandingProgressSummary(session: session)
                    .onTapGesture { onShowProgress() }
            }
        }
    }
}

private struct LandingBackground: View {
    var body: some View {
        LinearGradient(
            gradient: Gradient(colors: [
                Color(red: 0.76, green: 0.91, blue: 0.99),
                Color(red: 0.45, green: 0.69, blue: 0.91)
            ]),
            startPoint: .top,
            endPoint: .bottom
        )
        .overlay(HexagonPattern().opacity(0.16))
    }
}

private struct HexagonPattern: View {
    var body: some View {
        GeometryReader { proxy in
            Canvas { context, size in
                let step: CGFloat = 68
                let verticalStep = step * 0.75
                let rows = Int(ceil(size.height / verticalStep)) + 2
                let columns = Int(ceil(size.width / step)) + 3
                let hexPath = HexagonPattern.hexagonPath(radius: step / 2.4)

                for row in 0..<rows {
                    let y = CGFloat(row) * verticalStep
                    for column in 0..<columns {
                        let xOffset = CGFloat(column) * step + (row.isMultiple(of: 2) ? 0 : step / 2)
                        let transform = CGAffineTransform(translationX: xOffset, y: y)
                        let path = hexPath.applying(transform)
                        context.stroke(path, with: .color(Color.white.opacity(0.55)), lineWidth: 0.8)
                    }
                }
            }
        }
    }

    private static func hexagonPath(radius: CGFloat) -> Path {
        var path = Path()
        for side in 0..<6 {
            let angle = Double(side) * Double.pi / 3.0 + Double.pi / 6.0
            let point = CGPoint(
                x: radius * CGFloat(cos(angle)),
                y: radius * CGFloat(sin(angle))
            )
            if side == 0 {
                path.move(to: point)
            } else {
                path.addLine(to: point)
            }
        }
        path.closeSubpath()
        return path
    }
}

private struct LandingButtonStyle: ButtonStyle {
    enum Variant { case primary, secondary }

    let variant: Variant

    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(Typography.bodyEmphasis())
            .foregroundStyle(Color.white)
            .frame(maxWidth: .infinity)
            .padding(.vertical, 16)
            .background(background(for: configuration))
            .overlay(
                RoundedRectangle(cornerRadius: 26, style: .continuous)
                    .stroke(borderColor, lineWidth: variant == .primary ? 1.2 : 1)
            )
            .clipShape(RoundedRectangle(cornerRadius: 26, style: .continuous))
            .shadow(color: shadowColor.opacity(configuration.isPressed ? 0.4 : 0.2), radius: 12, y: 10)
            .scaleEffect(configuration.isPressed ? 0.97 : 1)
    }

    private var shadowColor: Color {
        switch variant {
        case .primary: return Color.blue.opacity(0.5)
        case .secondary: return Color.black.opacity(0.35)
        }
    }

    private var borderColor: Color {
        switch variant {
        case .primary: return Color.white.opacity(0.5)
        case .secondary: return Color.white.opacity(0.35)
        }
    }

    @ViewBuilder
    private func background(for configuration: Configuration) -> some View {
        let baseOpacity = configuration.isPressed ? 0.85 : 1.0
        switch variant {
        case .primary:
            RoundedRectangle(cornerRadius: 26, style: .continuous)
                .fill(
                    LinearGradient(
                        colors: [
                            Color.ipAccent.opacity(0.92 * baseOpacity),
                            Color.ipAccent.opacity(0.8 * baseOpacity)
                        ],
                        startPoint: .leading,
                        endPoint: .trailing
                    )
                )
        case .secondary:
            RoundedRectangle(cornerRadius: 26, style: .continuous)
                .fill(
                    LinearGradient(
                        colors: [
                            Color.white.opacity(0.32 * baseOpacity),
                            Color.white.opacity(0.24 * baseOpacity)
                        ],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )
        }
    }
}

private struct LandingProgressSummary: View {
    let session: CompletedQuizSession

    private static let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .short
        return formatter
    }()

    var body: some View {
        HStack(spacing: 16) {
            VStack(alignment: .leading, spacing: 6) {
                Text("Last Session")
                    .font(.caption.weight(.semibold))
                    .foregroundStyle(Color.white.opacity(0.8))
                Text(Self.dateFormatter.string(from: session.completedAt))
                    .font(.callout)
                    .foregroundStyle(Color.white.opacity(0.9))
                Text("Score: \(session.correctCount)/\(session.totalQuestions)")
                    .font(.footnote.weight(.semibold))
                    .foregroundStyle(Color.white.opacity(0.85))
            }
            Spacer()
            Image(systemName: "arrow.right.circle.fill")
                .font(.title)
                .foregroundStyle(Color.white.opacity(0.75))
        }
        .padding(18)
        .background(Color.white.opacity(0.15))
        .clipShape(RoundedRectangle(cornerRadius: 22, style: .continuous))
        .shadow(color: Color.black.opacity(0.15), radius: 18, y: 12)
        .padding(.horizontal, 24)
    }
}
