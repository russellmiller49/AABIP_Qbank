import SwiftUI
#if canImport(UIKit)
import UIKit
#endif

struct ProgressReportView: View {
    @EnvironmentObject private var environment: AppEnvironment
    @Environment(\.dismiss) private var dismiss

    @State private var startDate: Date = Calendar.current.date(byAdding: .month, value: -1, to: Date()) ?? Date()
    @State private var endDate: Date = Date()
    @State private var selectedCategories: Set<String> = []
    @State private var didInitialize = false
    @State private var didCopyReport = false

    private var modules: [Module] {
        environment.questionBankService.moduleSummaries().sorted { $0.title < $1.title }
    }

    private var activeCategoryIDs: Set<String> {
        let all = Set(modules.map(\.id))
        let filtered = selectedCategories.isEmpty ? all : selectedCategories
        return filtered.isEmpty ? all : filtered
    }

    private var reportData: ReportData {
        ReportBuilder.buildReport(
            sessions: environment.completedQuizSessions,
            questionBank: environment.questionBankService,
            startDate: startDate,
            endDate: endDate,
            includedCategoryIDs: activeCategoryIDs
        )
    }

    private var reportText: String {
        ReportBuilder.makeShareText(report: reportData, startDate: startDate, endDate: endDate)
    }

    var body: some View {
        Form {
            timeframeSection
            categorySection
            summarySection
            if reportData.totalQuestions > 0 {
                categoryBreakdownSection
                reportPreviewSection
                shareSection
            } else {
                Section {
                    Text("No sessions found in the selected timeframe. Adjust your filters and try again.")
                        .font(.footnote)
                        .foregroundStyle(Color.secondary)
                }
            }
        }
        .navigationTitle("Progress Report")
        .navigationBarTitleDisplayMode(.inline)
        .onAppear(perform: initializeIfNeeded)
        .onChange(of: startDate) { _, newValue in
            if newValue > endDate {
                endDate = newValue
            }
        }
        .onChange(of: endDate) { _, newValue in
            if newValue < startDate {
                startDate = newValue
            }
        }
        .alert("Copied", isPresented: $didCopyReport) {
            Button("OK", role: .cancel) { }
        } message: {
            Text("Report text copied to the clipboard.")
        }
    }

    private var timeframeSection: some View {
        Section("Timeframe") {
            DatePicker("From", selection: $startDate, displayedComponents: .date)
            DatePicker("To", selection: $endDate, in: startDate...Date(), displayedComponents: .date)
            quickRangeButtons
        }
    }

    private var quickRangeButtons: some View {
        HStack {
            Button("7 days") { applyQuickRange(days: 7) }
            Button("30 days") { applyQuickRange(days: 30) }
            Button("90 days") { applyQuickRange(days: 90) }
        }
        .buttonStyle(.bordered)
    }

    private var categorySection: some View {
        Section("Categories") {
            if modules.isEmpty {
                Text("Question bank is still loading modules.")
                    .font(.footnote)
                    .foregroundStyle(Color.secondary)
            } else {
                ForEach(modules, id: \.id) { module in
                    Toggle(isOn: Binding(
                        get: { activeCategoryIDs.contains(module.id) },
                        set: { newValue in
                            if newValue {
                                selectedCategories.insert(module.id)
                            } else {
                                selectedCategories.remove(module.id)
                            }
                        }
                    )) {
                        VStack(alignment: .leading, spacing: 4) {
                            Text(module.title)
                                .font(.body)
                            Text("\(module.questionCount) questions • \(module.difficulty.rawValue.capitalized)")
                                .font(.caption)
                                .foregroundStyle(Color.secondary)
                        }
                    }
                }
                Button("Select All") {
                    selectedCategories = Set(modules.map(\.id))
                }
                .buttonStyle(.borderless)
                Button("Clear Selection") {
                    selectedCategories.removeAll()
                }
                .buttonStyle(.borderless)
            }
        }
    }

    private var summarySection: some View {
        Section("Overview") {
            HStack {
                VStack(alignment: .leading, spacing: 8) {
                    Text("Total Questions")
                        .font(.subheadline)
                        .foregroundStyle(Color.secondary)
                    Text("\(reportData.totalQuestions)")
                        .font(.title2.weight(.semibold))
                }
                Spacer()
                VStack(alignment: .leading, spacing: 8) {
                    Text("Overall Score")
                        .font(.subheadline)
                        .foregroundStyle(Color.secondary)
                    Text(reportData.accuracy.formatted(.percent.precision(.fractionLength(1))))
                        .font(.title2.weight(.semibold))
                }
                Spacer()
                VStack(alignment: .leading, spacing: 8) {
                    Text("Correct")
                        .font(.subheadline)
                        .foregroundStyle(Color.secondary)
                    Text("\(reportData.correctQuestions)")
                        .font(.title2.weight(.semibold))
                }
            }
        }
    }

    private var categoryBreakdownSection: some View {
        Section("Scores by Category") {
            ForEach(reportData.categories) { category in
                VStack(alignment: .leading, spacing: 6) {
                    HStack {
                        Text(category.module.title)
                            .font(.headline)
                        Spacer()
                        Text(category.accuracy.formatted(.percent.precision(.fractionLength(1))))
                            .font(.subheadline.weight(.semibold))
                            .foregroundStyle(category.accuracy >= 0.75 ? Color.green : Color.orange)
                    }
                    ProgressView(value: Double(category.correct), total: Double(category.total))
                        .tint(Color.ipAccent)
                    Text("\(category.correct)/\(category.total) correct")
                        .font(.caption)
                        .foregroundStyle(Color.secondary)
                }
                .padding(.vertical, 4)
            }
        }
    }

    private var reportPreviewSection: some View {
        Section("Report Preview") {
            Text(reportText)
                .font(.footnote)
                .textSelection(.enabled)
        }
    }

    private var shareSection: some View {
        Section {
            ShareLink(item: reportText) {
                Label("Share Report", systemImage: "square.and.arrow.up")
            }
#if canImport(UIKit)
            Button {
                UIPasteboard.general.string = reportText
                didCopyReport = true
            } label: {
                Label("Copy to Clipboard", systemImage: "doc.on.doc")
            }
#endif
        }
    }

    private func applyQuickRange(days: Int) {
        if let newStart = Calendar.current.date(byAdding: .day, value: -days, to: Date()) {
            startDate = newStart
            endDate = Date()
        }
    }

    private func initializeIfNeeded() {
        guard !didInitialize else { return }
        didInitialize = true
        selectedCategories = Set(modules.map(\.id))
        if startDate > endDate {
            startDate = endDate
        }
    }
}

private struct ReportData {
    let totalQuestions: Int
    let correctQuestions: Int
    let categories: [CategorySummary]

    var accuracy: Double {
        guard totalQuestions > 0 else { return 0 }
        return Double(correctQuestions) / Double(totalQuestions)
    }
}

private struct CategorySummary: Identifiable {
    let module: Module
    var correct: Int
    var total: Int

    var id: String { module.id }

    var accuracy: Double {
        guard total > 0 else { return 0 }
        return Double(correct) / Double(total)
    }
}

private enum ReportBuilder {
    static func buildReport(
        sessions: [CompletedQuizSession],
        questionBank: QuestionBankService,
        startDate: Date,
        endDate: Date,
        includedCategoryIDs: Set<String>
    ) -> ReportData {
        let calendar = Calendar.current
        let normalizedStart = calendar.startOfDay(for: startDate)
        let normalizedEnd: Date = {
            guard let endOfDay = calendar.date(bySettingHour: 23, minute: 59, second: 59, of: endDate) else {
                return endDate
            }
            return endOfDay
        }()

        let filteredSessions = sessions.filter { session in
            session.completedAt >= normalizedStart && session.completedAt <= normalizedEnd
        }

        var categoryMap: [String: CategorySummary] = [:]
        var totalCorrect = 0
        var totalQuestions = 0

        for session in filteredSessions {
            for reference in session.questionReferences {
                guard includedCategoryIDs.contains(reference.moduleID),
                      let sessionQuestion = questionBank.sessionQuestion(for: reference) else { continue }

                let isCorrect = session.selections[sessionQuestion.question.id] == sessionQuestion.question.correctOptionId
                totalQuestions += 1
                if isCorrect { totalCorrect += 1 }

                var summary = categoryMap[reference.moduleID] ?? CategorySummary(
                    module: sessionQuestion.module.summary,
                    correct: 0,
                    total: 0
                )
                summary.total += 1
                if isCorrect { summary.correct += 1 }
                categoryMap[reference.moduleID] = summary
            }
        }

        // Ensure every selected category appears even if zero questions were answered.
        for module in questionBank.moduleSummaries() where includedCategoryIDs.contains(module.id) {
            if categoryMap[module.id] == nil {
                categoryMap[module.id] = CategorySummary(module: module, correct: 0, total: 0)
            }
        }

        let categories = categoryMap.values.sorted { lhs, rhs in
            lhs.module.title < rhs.module.title
        }

        return ReportData(
            totalQuestions: totalQuestions,
            correctQuestions: totalCorrect,
            categories: categories
        )
    }

    static func makeShareText(report: ReportData, startDate: Date, endDate: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        let dateRange = "Report: \(formatter.string(from: startDate)) - \(formatter.string(from: endDate))"
        var lines = [dateRange]
        if report.totalQuestions > 0 {
            let percent = report.accuracy.formatted(.percent.precision(.fractionLength(1)))
            lines.append("Overall: \(report.correctQuestions)/\(report.totalQuestions) correct (\(percent))")
            lines.append("\nBy Category:")
            for category in report.categories.sorted(by: { $0.module.title < $1.module.title }) {
                let accuracy = category.accuracy.formatted(.percent.precision(.fractionLength(1)))
                lines.append("• \(category.module.title): \(category.correct)/\(category.total) (\(accuracy))")
            }
        } else {
            lines.append("No completed questions in this timeframe.")
        }
        return lines.joined(separator: "\n")
    }
}
