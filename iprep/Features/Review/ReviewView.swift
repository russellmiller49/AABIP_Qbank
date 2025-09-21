import SwiftUI

struct ReviewView: View {
    @EnvironmentObject private var environment: AppEnvironment
    @Environment(\.horizontalSizeClass) private var horizontalSizeClass
    @State private var selectedSession: CompletedQuizSession?

    private var sessions: [CompletedQuizSession] {
        environment.completedQuizSessions
    }

    private var hasHistory: Bool {
        !sessions.isEmpty
    }

    private var isRegularWidth: Bool {
        horizontalSizeClass == .regular
    }

    var body: some View {
        Group {
            if hasHistory {
                if isRegularWidth {
                    splitView
                } else {
                    NavigationStack { stackList }
                }
            } else {
                emptyState
            }
        }
        .navigationTitle("Review")
        .background(Color.ipBackground.ignoresSafeArea())
    }

    private var stackList: some View {
        List(sessions, id: \.id) { session in
            NavigationLink(value: session) {
                ReviewSessionRow(session: session)
            }
        }
#if os(iOS)
        .listStyle(.insetGrouped)
#endif
        .navigationDestination(for: CompletedQuizSession.self) { session in
            SessionReviewDetailView(session: session)
        }
    }

    private var splitView: some View {
        NavigationSplitView(columnVisibility: .constant(.all)) {
            List(sessions, id: \.id, selection: $selectedSession) { session in
                ReviewSessionRow(session: session)
                    .tag(session)
            }
#if os(iOS)
            .listStyle(.insetGrouped)
#endif
            .navigationTitle("Sessions")
        } detail: {
            if let session = selectedSession ?? sessions.first {
                SessionReviewDetailView(session: session)
            } else {
                Text("Select a session to review details")
                    .font(.body)
                    .foregroundStyle(Color.secondary)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
        }
        .onAppear {
            if selectedSession == nil {
                selectedSession = sessions.first
            }
        }
    }

    private var emptyState: some View {
        VStack(spacing: 18) {
            Image(systemName: "text.book.closed")
                .font(.system(size: 56))
                .foregroundStyle(Color.secondary)
            Text("Review workspace")
                .font(Typography.heading(size: .title2))
            Text("Complete a practice session to unlock detailed answer explanations and reference notes here.")
                .font(.body)
                .multilineTextAlignment(.center)
                .foregroundStyle(Color.secondary)
                .padding(.horizontal, 24)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

private struct ReviewSessionRow: View {
    let session: CompletedQuizSession

    static let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .short
        return formatter
    }()

    static let durationFormatter: DateComponentsFormatter = {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.minute, .second]
        formatter.unitsStyle = .abbreviated
        return formatter
    }()

    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            HStack {
                Text(Self.dateFormatter.string(from: session.completedAt))
                    .font(.headline)
                Spacer()
                Text("\(session.correctCount)/\(session.totalQuestions) correct")
                    .font(.subheadline.weight(.semibold))
                    .foregroundStyle(session.accuracy >= 0.7 ? Color.green : Color.orange)
            }
            Text(summaryLine)
                .font(.footnote)
                .foregroundStyle(Color.secondary)
        }
        .padding(.vertical, 4)
    }

    private var summaryLine: String {
        let duration = Self.durationFormatter.string(from: session.duration) ?? "—"
        let percent = Int((session.accuracy * 100).rounded())
        return "Score: \(percent)% • Time: \(duration)"
    }
}

private struct SessionReviewDetailView: View {
    let session: CompletedQuizSession
    @EnvironmentObject private var environment: AppEnvironment

    private var questions: [QuizSessionQuestion] {
        environment.questionBankService.sessionQuestions(from: session.questionReferences)
    }

    private var moduleBreakdown: [ModuleBreakdownItem] {
        let grouped = Dictionary(grouping: questions) { $0.module.id }
        return grouped.compactMap { key, questions in
            guard let module = questions.first?.module else { return nil }
            let correct = questions.reduce(into: 0) { partial, question in
                if session.selections[question.id] == question.question.correctOptionId {
                    partial += 1
                }
            }
            return ModuleBreakdownItem(module: module, correct: correct, total: questions.count)
        }.sorted { $0.module.summary.title < $1.module.summary.title }
    }

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 24) {
                header
                if !moduleBreakdown.isEmpty {
                    breakdownSection
                }
                ForEach(questions) { question in
                    ReviewQuestionCard(question: question, selection: session.selections[question.id])
                }
            }
            .padding(20)
        }
        .background(Color.ipBackground.ignoresSafeArea())
        .navigationTitle("Session Review")
    }

    private var header: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Completed on \(ReviewSessionRow.dateFormatter.string(from: session.completedAt))")
                .font(.caption)
                .foregroundStyle(Color.secondary)
            HStack(alignment: .lastTextBaseline, spacing: 12) {
                Text("\(session.correctCount)")
                    .font(.system(size: 48, weight: .bold))
                Text("out of \(session.totalQuestions) correct")
                    .font(.title3.weight(.semibold))
            }
            Text(summaryMetrics)
                .font(.subheadline)
                .foregroundStyle(Color.secondary)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(20)
        .background(Color.ipSurface)
        .clipShape(RoundedRectangle(cornerRadius: 24, style: .continuous))
    }

    private var summaryMetrics: String {
        let percent = Int((session.accuracy * 100).rounded())
        let duration = ReviewSessionRow.durationFormatter.string(from: session.duration) ?? "—"
        return "Score: \(percent)% • Time: \(duration)"
    }

    private var breakdownSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Module Breakdown")
                .font(.headline)
            ForEach(moduleBreakdown, id: \.module.id) { item in
                HStack {
                    VStack(alignment: .leading, spacing: 4) {
                        Text(item.module.summary.title)
                            .font(.body.weight(.semibold))
                        Text("\(item.correct)/\(item.total) correct")
                            .font(.caption)
                            .foregroundStyle(Color.secondary)
                    }
                    Spacer()
                    ProgressView(value: Double(item.correct), total: Double(item.total))
                        .progressViewStyle(.linear)
                        .frame(width: 120)
                        .tint(Color.ipAccent)
                }
            }
        }
        .padding(20)
        .background(Color.ipSurface)
        .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
    }
}

private struct ReviewQuestionCard: View {
    let question: QuizSessionQuestion
    let selection: String?

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            VStack(alignment: .leading, spacing: 8) {
                Text(question.module.summary.title)
                    .font(.caption)
                    .foregroundStyle(Color.secondary)
                Text(question.question.prompt)
                    .font(.headline)
            }
            VStack(alignment: .leading, spacing: 10) {
                ForEach(question.question.options) { option in
                    optionRow(for: option)
                }
            }
            if let explanation = explanationText {
                VStack(alignment: .leading, spacing: 8) {
                    Text("Explanation")
                        .font(.subheadline.weight(.semibold))
                    Text(explanation)
                        .font(.body)
                    if !question.question.references.isEmpty {
                        Divider()
                        VStack(alignment: .leading, spacing: 4) {
                            Text("References")
                                .font(.subheadline.weight(.semibold))
                            ForEach(question.question.references, id: \.self) { reference in
                                Text(reference)
                                    .font(.footnote)
                                    .foregroundStyle(Color.secondary)
                            }
                        }
                    }
                }
                .foregroundStyle(Color.primary)
            }
        }
        .padding(20)
        .background(Color.ipSurface)
        .clipShape(RoundedRectangle(cornerRadius: 24, style: .continuous))
    }

    private var explanationText: String? {
        selection == nil ? nil : question.question.explanation
    }

    private func optionRow(for option: QuizOption) -> some View {
        let isCorrect = option.id == question.question.correctOptionId
        let isSelected = selection == option.id
        return HStack(alignment: .top, spacing: 12) {
            Text(option.id.uppercased())
                .font(.headline)
                .frame(width: 28, height: 28)
                .background(Circle().fill(Color.ipSurfaceElevated))
            VStack(alignment: .leading, spacing: 4) {
                Text(option.text)
                    .font(.body)
                    .foregroundStyle(Color.primary)
                if isSelected {
                    Text(isCorrect ? "You selected • Correct" : "You selected • Incorrect")
                        .font(.caption)
                        .foregroundStyle(isCorrect ? Color.green : Color.red)
                }
            }
            Spacer()
        }
        .padding(14)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(optionBackground(isCorrect: isCorrect, isSelected: isSelected))
        .clipShape(RoundedRectangle(cornerRadius: 18, style: .continuous))
        .overlay(
            RoundedRectangle(cornerRadius: 18, style: .continuous)
                .stroke(optionBorder(isCorrect: isCorrect, isSelected: isSelected), lineWidth: 1.5)
        )
    }

    private func optionBackground(isCorrect: Bool, isSelected: Bool) -> Color {
        if isCorrect { return Color.green.opacity(0.16) }
        if isSelected { return Color.red.opacity(0.14) }
        return Color.ipSurfaceElevated.opacity(0.4)
    }

    private func optionBorder(isCorrect: Bool, isSelected: Bool) -> Color {
        if isCorrect { return Color.green }
        if isSelected { return Color.red }
        return Color.clear
    }
}

private struct ModuleBreakdownItem: Identifiable {
    let module: QuizModule
    let correct: Int
    let total: Int

    var id: String { module.id }
}
