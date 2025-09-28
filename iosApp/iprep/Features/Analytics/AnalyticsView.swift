import SwiftUI
import Charts

struct AnalyticsView: View {
    @EnvironmentObject private var environment: AppEnvironment
    @Environment(\.horizontalSizeClass) private var horizontalSizeClass

    private var sessions: [CompletedQuizSession] { environment.completedQuizSessions }
    private var hasHistory: Bool { !sessions.isEmpty }
    private var isRegularWidth: Bool { horizontalSizeClass == .regular }

    var body: some View {
        Group {
            if hasHistory {
                ScrollView {
                    VStack(spacing: 24) {
                        summaryGrid
                        reportCTA
                        trendSection
                        modulePerformanceSection
                    }
                    .padding(20)
                }
            } else {
                emptyState
            }
        }
        .background(Color.ipBackground.ignoresSafeArea())
        .navigationTitle("Analytics")
    }

    private var summaryGrid: some View {
        let gridColumns = isRegularWidth ? [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())] : [GridItem(.flexible()), GridItem(.flexible())]
        return LazyVGrid(columns: gridColumns, spacing: 18) {
            SummaryCard(
                title: "Quizzes Completed",
                value: "\(sessions.count)",
                detail: "Across \(totalQuestions) questions"
            )
            SummaryCard(
                title: "Average Score",
                value: "\(formattedPercent(averageAccuracy))",
                detail: "Best \(formattedPercent(bestAccuracy))"
            )
            SummaryCard(
                title: "Practice Time",
                value: formattedDuration(totalDuration),
                detail: "Avg \(formattedDuration(averageDuration)) each"
            )
            SummaryCard(
                title: "Current Streak",
                value: "\(currentStreak) days",
                detail: "Longest \(longestStreak)"
            )
        }
    }


    private var reportCTA: some View {
        NavigationLink {
            ProgressReportView()
        } label: {
            HStack(spacing: 16) {
                Image(systemName: "doc.text.magnifyingglass")
                    .font(.system(size: 30))
                    .foregroundStyle(Color.ipAccent)
                VStack(alignment: .leading, spacing: 4) {
                    Text("Generate Progress Report")
                        .font(Typography.heading(size: .title3))
                        .foregroundStyle(Color.primary)
                    Text("Create a shareable summary for your program director.")
                        .font(.subheadline)
                        .foregroundStyle(Color.secondary)
                }
                Spacer()
                Image(systemName: "chevron.right")
                    .foregroundStyle(Color.secondary)
            }
            .padding(20)
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(Color.ipSurface)
            .clipShape(RoundedRectangle(cornerRadius: 24, style: .continuous))
            .shadow(color: Color.black.opacity(0.05), radius: 12, y: 8)
        }
        .buttonStyle(.plain)
    }

    private var trendSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                Text("Accuracy Trend")
                    .font(Typography.heading(size: .title3))
                Spacer()
                if let latest = sessions.first {
                    Text("Latest: \(formattedPercent(latest.accuracy))")
                        .font(.caption)
                        .foregroundStyle(Color.secondary)
                }
            }
            Chart(trendPoints) { point in
                LineMark(
                    x: .value("Date", point.date),
                    y: .value("Accuracy", point.accuracy)
                )
                .foregroundStyle(Color.ipAccent)
                PointMark(
                    x: .value("Date", point.date),
                    y: .value("Accuracy", point.accuracy)
                )
                .symbolSize(40)
                .foregroundStyle(Color.ipAccent)
            }
            .chartYScale(domain: 0.4...1.05)
            .frame(height: 220)
            .chartXAxis {
                AxisMarks(values: .automatic(desiredCount: isRegularWidth ? 6 : 4)) { _ in
                    AxisValueLabel()
                }
            }
            .chartYAxis {
                AxisMarks(position: .leading) { value in
                    if let doubleValue = value.as(Double.self) {
                        AxisValueLabel("\(Int(doubleValue * 100))%")
                    }
                }
            }
        }
        .padding(20)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color.ipSurface)
        .clipShape(RoundedRectangle(cornerRadius: 24, style: .continuous))
    }

    private var modulePerformanceSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Module Insights")
                .font(Typography.heading(size: .title3))
            if modulePerformances.isEmpty {
                Text("Answer more questions to unlock module insights.")
                    .font(.subheadline)
                    .foregroundStyle(Color.secondary)
            } else {
                ForEach(modulePerformances) { performance in
                    VStack(alignment: .leading, spacing: 6) {
                        HStack {
                            Text(performance.module.title)
                                .font(.headline)
                            Spacer()
                            Text(formattedPercent(performance.accuracy))
                                .font(.subheadline.weight(.semibold))
                                .foregroundStyle(performance.accuracy >= 0.75 ? Color.green : Color.orange)
                        }
                        ProgressView(value: Double(performance.correct), total: Double(performance.total))
                            .progressViewStyle(.linear)
                            .tint(Color.ipAccent)
                        Text("\(performance.correct)/\(performance.total) correct • \(performance.sessionCount) sessions")
                            .font(.caption)
                            .foregroundStyle(Color.secondary)
                    }
                    .padding(16)
                    .background(Color.ipSurface)
                    .clipShape(RoundedRectangle(cornerRadius: 18, style: .continuous))
                }
            }
        }
    }

    private var emptyState: some View {
        VStack(spacing: 18) {
            Image(systemName: "chart.bar")
                .font(.system(size: 56))
                .foregroundStyle(Color.secondary)
            Text("Analytics coming to life")
                .font(Typography.heading(size: .title2))
            Text("Complete at least one practice session to view trends, streaks, and module insights.")
                .font(.body)
                .multilineTextAlignment(.center)
                .foregroundStyle(Color.secondary)
                .padding(.horizontal, 24)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }

    // MARK: - Metrics

    private var totalQuestions: Int {
        sessions.reduce(into: 0) { $0 += $1.totalQuestions }
    }

    private var averageAccuracy: Double {
        guard !sessions.isEmpty else { return 0 }
        let total = sessions.reduce(0.0) { $0 + $1.accuracy }
        return total / Double(sessions.count)
    }

    private var bestAccuracy: Double {
        sessions.map(\.accuracy).max() ?? 0
    }

    private var totalDuration: TimeInterval {
        sessions.reduce(0) { $0 + $1.duration }
    }

    private var averageDuration: TimeInterval {
        guard !sessions.isEmpty else { return 0 }
        return totalDuration / Double(sessions.count)
    }

    private var currentStreak: Int {
        guard !sessions.isEmpty else { return 0 }
        let sorted = sessions.sorted { $0.completedAt > $1.completedAt }
        var streak = 0
        var previousDay: Date?
        let calendar = Calendar.current
        for session in sorted {
            let day = calendar.startOfDay(for: session.completedAt)
            if let previousDay {
                let difference = calendar.dateComponents([.day], from: day, to: previousDay).day ?? 0
                if difference == 0 {
                    continue
                } else if difference == 1 {
                    streak += 1
                } else {
                    break
                }
            } else {
                streak = 1
            }
            previousDay = day
        }
        return streak
    }

    private var longestStreak: Int {
        guard !sessions.isEmpty else { return 0 }
        let sorted = sessions.sorted { $0.completedAt < $1.completedAt }
        let calendar = Calendar.current
        var longest = 1
        var streak = 1
        for index in 1..<sorted.count {
            let current = calendar.startOfDay(for: sorted[index].completedAt)
            let previous = calendar.startOfDay(for: sorted[index - 1].completedAt)
            let diff = calendar.dateComponents([.day], from: previous, to: current).day ?? 0
            if diff == 0 {
                continue
            } else if diff == 1 {
                streak += 1
                longest = max(longest, streak)
            } else {
                streak = 1
            }
        }
        return longest
    }

    private var trendPoints: [AccuracyPoint] {
        sessions
            .sorted { $0.completedAt < $1.completedAt }
            .map { AccuracyPoint(date: $0.completedAt, accuracy: $0.accuracy) }
    }

    private var modulePerformances: [ModulePerformance] {
        var stats: [String: ModulePerformance] = [:]
        for session in sessions {
            let questions = environment.questionBankService.sessionQuestions(from: session.questionReferences)
            var seenModules: Set<String> = []
            for question in questions {
                let module = question.module.summary
                var entry = stats[module.id] ?? ModulePerformance(module: module, correct: 0, total: 0, sessionCount: 0)
                entry.total += 1
                if session.selections[question.id] == question.question.correctOptionId {
                    entry.correct += 1
                }
                if seenModules.insert(module.id).inserted {
                    entry.sessionCount += 1
                }
                stats[module.id] = entry
            }
        }
        return stats.values.sorted { lhs, rhs in
            lhs.accuracy == rhs.accuracy ? lhs.module.title < rhs.module.title : lhs.accuracy > rhs.accuracy
        }
    }

    private func formattedPercent(_ value: Double) -> String {
        NumberFormatter.percentFormatter.string(from: NSNumber(value: value)) ?? "0%"
    }

    private func formattedDuration(_ interval: TimeInterval) -> String {
        DateComponentsFormatter.practiceFormatter.string(from: interval) ?? "0s"
    }
}

private struct SummaryCard: View {
    let title: String
    let value: String
    let detail: String

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(title.uppercased())
                .font(.caption.weight(.semibold))
                .foregroundStyle(Color.secondary)
            Text(value)
                .font(.system(size: 32, weight: .bold, design: .rounded))
                .foregroundStyle(Color.primary)
            Text(detail)
                .font(.footnote)
                .foregroundStyle(Color.secondary)
        }
        .padding(20)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color.ipSurface)
        .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
    }
}

private struct AccuracyPoint: Identifiable {
    let id = UUID()
    let date: Date
    let accuracy: Double
}

private struct ModulePerformance: Identifiable {
    let module: Module
    var correct: Int
    var total: Int
    var sessionCount: Int

    var id: String { module.id }

    var accuracy: Double {
        guard total > 0 else { return 0 }
        return Double(correct) / Double(total)
    }
}

private extension NumberFormatter {
    static let percentFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .percent
        formatter.maximumFractionDigits = 0
        return formatter
    }()
}

private extension DateComponentsFormatter {
    static let practiceFormatter: DateComponentsFormatter = {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.hour, .minute, .second]
        formatter.unitsStyle = .abbreviated
        return formatter
    }()
}
