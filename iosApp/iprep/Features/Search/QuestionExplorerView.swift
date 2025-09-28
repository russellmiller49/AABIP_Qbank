import SwiftUI

struct QuestionExplorerView: View {
    @EnvironmentObject private var environment: AppEnvironment
    @State private var questions: [QuizSessionQuestion] = []
    @State private var modules: [Module] = []

    @State private var selectedModuleID: String?
    @State private var selectedDifficulty: Module.Difficulty?
    @State private var flaggedOnly = false
    @State private var withNotesOnly = false
    @State private var needsReviewOnly = false
    @State private var confidenceSelection: Set<QuestionStudyState.Confidence> = []

    var body: some View {
        List {
            filterSection
            resultsSection
        }
        .listStyle(.insetGrouped)
        .background(Color.ipBackground.ignoresSafeArea())
        .navigationTitle("Question Explorer")
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button("Reset", action: resetFilters)
                    .disabled(!areFiltersActive)
            }
        }
        .onAppear(perform: loadIfNeeded)
    }

    private var filterSection: some View {
        Section("Filters") {
            Picker("Domain", selection: $selectedModuleID) {
                Text("All domains").tag(String?.none)
                ForEach(modules) { module in
                    Text(module.title).tag(String?(module.id))
                }
            }

            Picker("Difficulty", selection: $selectedDifficulty) {
                Text("All difficulty levels").tag(Module.Difficulty?.none)
                ForEach(Module.Difficulty.allCases, id: \.self) { difficulty in
                    Text(difficulty.rawValue.capitalized).tag(Module.Difficulty?(difficulty))
                }
            }

            Toggle("Flagged only", isOn: $flaggedOnly)
            Toggle("With notes only", isOn: $withNotesOnly)
            Toggle("Due for review", isOn: $needsReviewOnly)

            VStack(alignment: .leading, spacing: 8) {
                Text("Confidence")
                    .font(.footnote.weight(.semibold))
                    .foregroundStyle(Color.secondary)
                confidenceChips
            }
            .padding(.top, 6)
        }
    }

    private var resultsSection: some View {
        Section(header: resultsHeader) {
            let matches = filteredQuestions
            if matches.isEmpty {
                ContentUnavailableView(
                    "No matches",
                    systemImage: "magnifyingglass",
                    description: Text("Adjust your filters to see questions here.")
                )
                .frame(maxWidth: .infinity, alignment: .center)
                .listRowInsets(EdgeInsets())
                .background(Color.clear)
            } else {
                ForEach(matches) { question in
                    let state = environment.studyState(for: question.id)
                    NavigationLink {
                        QuestionExplorerDetailView(question: question, state: state)
                    } label: {
                        QuestionExplorerRow(question: question, state: state)
                    }
                    .listRowBackground(Color.ipSurface)
                }
            }
        }
    }

    private var resultsHeader: some View {
        HStack {
            Text("Results")
            Spacer()
            Text("\(filteredQuestions.count)")
                .font(.footnote.monospacedDigit())
                .foregroundStyle(Color.secondary)
        }
    }

    private var filteredQuestions: [QuizSessionQuestion] {
        questions.filter { question in
            guard matchesDomain(question), matchesDifficulty(question) else { return false }
            let state = environment.studyState(for: question.id)
            if flaggedOnly && !(state?.flagged ?? false) { return false }
            if withNotesOnly && (state?.noteMarkdown.isEmpty ?? true) { return false }
            if needsReviewOnly && !(state?.needsReview ?? false) { return false }
            if !confidenceSelection.isEmpty {
                guard let confidence = state?.confidence, confidenceSelection.contains(confidence) else { return false }
            }
            return true
        }
        .sorted { lhs, rhs in
            if lhs.module.summary.title == rhs.module.summary.title {
                return lhs.question.number < rhs.question.number
            }
            return lhs.module.summary.title < rhs.module.summary.title
        }
    }

    private func matchesDomain(_ question: QuizSessionQuestion) -> Bool {
        guard let selectedModuleID else { return true }
        return question.module.id == selectedModuleID
    }

    private func matchesDifficulty(_ question: QuizSessionQuestion) -> Bool {
        guard let selectedDifficulty else { return true }
        return question.module.summary.difficulty == selectedDifficulty
    }

    private var areFiltersActive: Bool {
        selectedModuleID != nil ||
        selectedDifficulty != nil ||
        flaggedOnly ||
        withNotesOnly ||
        needsReviewOnly ||
        !confidenceSelection.isEmpty
    }

    private func resetFilters() {
        selectedModuleID = nil
        selectedDifficulty = nil
        flaggedOnly = false
        withNotesOnly = false
        needsReviewOnly = false
        confidenceSelection.removeAll()
    }

    private func loadIfNeeded() {
        guard questions.isEmpty else { return }
        modules = environment.questionBankService.moduleSummaries().sorted { $0.title < $1.title }
        questions = environment.questionBankService.allSessionQuestions()
    }

    private var confidenceChips: some View {
        let columns = [GridItem(.adaptive(minimum: 140), spacing: 10, alignment: .leading)]
        return LazyVGrid(columns: columns, alignment: .leading, spacing: 10) {
            ForEach(QuestionStudyState.Confidence.allCases) { confidence in
                let isSelected = confidenceSelection.contains(confidence)
                Button {
                    if isSelected {
                        confidenceSelection.remove(confidence)
                    } else {
                        confidenceSelection.insert(confidence)
                    }
                } label: {
                    HStack(spacing: 6) {
                        Image(systemName: confidence.iconName)
                        Text(confidence.title)
                    }
                    .font(.subheadline)
                    .padding(.horizontal, 12)
                    .padding(.vertical, 8)
                    .background(
                        Capsule()
                            .fill(isSelected ? Color.ipAccent.opacity(0.2) : Color.ipSurface)
                    )
                }
                .buttonStyle(.plain)
            }
        }
    }
}

private struct QuestionExplorerRow: View {
    let question: QuizSessionQuestion
    let state: QuestionStudyState?

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack {
                Text(question.module.summary.title)
                    .font(.caption)
                    .foregroundStyle(Color.secondary)
                Spacer()
                if let confidence = state?.confidence {
                    ConfidenceBadge(confidence: confidence)
                }
            }

            Text(question.question.prompt)
                .font(.headline)
                .foregroundStyle(Color.primary)
                .lineLimit(3)

            let tags = statusTags
            if !tags.isEmpty {
                HStack(spacing: 8) {
                    ForEach(Array(tags.enumerated()), id: \.offset) { _, tag in
                        TagBadge(label: tag.label, color: tag.color, systemImage: tag.icon)
                    }
                }
            }
        }
        .padding(16)
    }

    private var statusTags: [(label: String, icon: String, color: Color)] {
        var tags: [(String, String, Color)] = []
        if state?.flagged == true {
            tags.append(("Flagged", "flag.fill", .orange))
        }
        if let note = state?.noteMarkdown, !note.isEmpty {
            tags.append(("Note", "note.text", .blue))
        }
        if state?.needsReview == true {
            tags.append(("Due", "calendar", .pink))
        }
        return tags
    }
}

private struct QuestionExplorerDetailView: View {
    let question: QuizSessionQuestion
    let state: QuestionStudyState?

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 24) {
                header
                optionSection
                if let explanation = explanationText, !explanation.isEmpty {
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Explanation")
                            .font(.headline)
                        Text(explanation)
                            .font(.body)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
                if let note = state?.noteMarkdown, !note.isEmpty {
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Your note")
                            .font(.headline)
                        Text(note)
                            .font(.body)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
                if !question.question.references.isEmpty {
                    VStack(alignment: .leading, spacing: 8) {
                        Text("References")
                            .font(.headline)
                        ForEach(question.question.references, id: \.self) { reference in
                            Text(reference)
                                .font(.footnote)
                                .foregroundStyle(Color.secondary)
                                .frame(maxWidth: .infinity, alignment: .leading)
                        }
                    }
                }
            }
            .padding(20)
        }
        .background(Color.ipBackground.ignoresSafeArea())
        .navigationTitle("Question")
        .navigationBarTitleDisplayMode(.inline)
    }

    private var header: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(question.module.summary.title)
                .font(.caption)
                .foregroundStyle(Color.secondary)
            Text(question.question.prompt)
                .font(Typography.heading(size: .title3))
                .foregroundStyle(Color.primary)
                .frame(maxWidth: .infinity, alignment: .leading)
            if let state {
                HStack(spacing: 8) {
                    if state.flagged {
                        TagBadge(label: "Flagged", color: .orange, systemImage: "flag.fill")
                    }
                    if !state.noteMarkdown.isEmpty {
                        TagBadge(label: "Note", color: .blue, systemImage: "note.text")
                    }
                    if state.needsReview {
                        TagBadge(label: "Due", color: .pink, systemImage: "calendar")
                    }
                    if let confidence = state.confidence {
                        ConfidenceBadge(confidence: confidence)
                    }
                }
            }
        }
    }

    private var optionSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Options")
                .font(.headline)
            VStack(alignment: .leading, spacing: 10) {
                ForEach(question.question.options) { option in
                    optionRow(for: option)
                }
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }

    private func optionRow(for option: QuizOption) -> some View {
        let isCorrect = option.id == question.question.correctOptionId
        return HStack(alignment: .top, spacing: 12) {
            Text(option.id.uppercased())
                .font(.headline)
                .frame(width: 28, height: 28)
                .background(Circle().fill(Color.ipSurfaceElevated))
            Text(option.text)
                .font(.body)
                .foregroundStyle(Color.primary)
            Spacer()
            if isCorrect {
                Image(systemName: "checkmark.circle.fill")
                    .foregroundStyle(Color.green)
            }
        }
        .padding(14)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(optionBackground(isCorrect: isCorrect))
        .clipShape(RoundedRectangle(cornerRadius: 18, style: .continuous))
        .overlay(
            RoundedRectangle(cornerRadius: 18, style: .continuous)
                .stroke(optionBorder(isCorrect: isCorrect), lineWidth: 1.2)
        )
    }

    private func optionBackground(isCorrect: Bool) -> Color {
        isCorrect ? Color.green.opacity(0.16) : Color.ipSurfaceElevated.opacity(0.35)
    }

    private func optionBorder(isCorrect: Bool) -> Color {
        isCorrect ? Color.green.opacity(0.6) : Color.clear
    }

    private var explanationText: String? {
        let explanation = question.question.explanation.trimmingCharacters(in: .whitespacesAndNewlines)
        return explanation.isEmpty ? nil : explanation
    }
}

private struct ConfidenceBadge: View {
    let confidence: QuestionStudyState.Confidence

    var body: some View {
        Label(confidence.title, systemImage: confidence.iconName)
            .font(.caption.weight(.semibold))
            .padding(.horizontal, 10)
            .padding(.vertical, 6)
            .background(
                Capsule()
                    .fill(color.opacity(0.18))
            )
            .foregroundStyle(color)
    }

    private var color: Color {
        switch confidence {
        case .guess: return .red
        case .low: return .orange
        case .medium: return .blue
        case .high: return .green
        }
    }
}

private struct TagBadge: View {
    let label: String
    let color: Color
    let systemImage: String

    var body: some View {
        Label(label, systemImage: systemImage)
            .font(.caption)
            .padding(.horizontal, 10)
            .padding(.vertical, 4)
            .background(
                Capsule()
                    .fill(color.opacity(0.18))
            )
            .foregroundStyle(color)
    }
}

#Preview {
    QuestionExplorerView()
        .environmentObject(AppEnvironment.shared)
}
