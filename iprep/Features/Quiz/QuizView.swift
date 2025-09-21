import SwiftUI

struct QuizView: View {
    @EnvironmentObject private var environment: AppEnvironment
    @StateObject private var viewModel: QuizViewModel
    @State private var didConfigure = false
    @State private var didPrepareInitialSession = false
    @State private var quickStartCount = 10
    private let initialAction: QuizViewModel.InitialSessionAction

    init(initialAction: QuizViewModel.InitialSessionAction = .startFresh) {
        self._viewModel = StateObject(wrappedValue: QuizViewModel())
        self.initialAction = initialAction
    }

    var body: some View {
        Group {
            switch viewModel.state {
            case .idle, .loading:
                ProgressView("Loading quiz…")
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Color.ipBackground)
            case .error(let message):
                VStack(spacing: 16) {
                    Image(systemName: "exclamationmark.triangle")
                        .font(.system(size: 46))
                        .foregroundStyle(Color.orange)
                    Text(message)
                        .font(.body)
                        .multilineTextAlignment(.center)
                    Button("Retry") {
                        viewModel.startQuickStart(limit: quickStartCount)
                    }
                    .buttonStyle(.borderedProminent)
                }
                .padding()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color.ipBackground)
            case .completed:
                summaryView
            case .ready:
                if let question = viewModel.currentQuestion {
                    quizQuestionView(question)
                } else {
                    ProgressView()
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .background(Color.ipBackground)
                }
            }
        }
        .navigationTitle("Quiz")
        .background(Color.ipBackground.ignoresSafeArea())
        .toolbar {
#if os(iOS)
            ToolbarItem(placement: .topBarTrailing) {
                Menu {
                    Picker("Number of Questions", selection: $quickStartCount) {
                        ForEach([5, 10, 15, 20], id: \.self) { count in
                            Text("\(count) questions").tag(count)
                        }
                    }
                    Divider()
                    Button("Start Over", role: .none) {
                        viewModel.restart(limit: quickStartCount)
                    }
                } label: {
                    Image(systemName: "ellipsis.circle")
                }
            }
#endif
        }
        .task {
            if !didConfigure {
                viewModel.configure(
                    questionBank: environment.questionBankService,
                    localStore: environment.localStore
                )
                didConfigure = true
            }
            if !didPrepareInitialSession {
                viewModel.prepareInitialSession(limit: quickStartCount, resumePreference: initialAction)
                didPrepareInitialSession = true
            }
        }
    }

    private func quizQuestionView(_ sessionQuestion: QuizSessionQuestion) -> some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 24) {
                header(for: sessionQuestion)
                prompt(for: sessionQuestion)
                if !sessionQuestion.question.imageURLs.isEmpty {
                    imageCarousel(for: sessionQuestion)
                }
                optionsList(for: sessionQuestion)
                if viewModel.isAnswered(sessionQuestion) {
                    explanation(for: sessionQuestion)
                }
                controlBar(for: sessionQuestion)
            }
            .padding(20)
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }

    private func header(for sessionQuestion: QuizSessionQuestion) -> some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(sessionQuestion.module.summary.title)
                .font(.headline)
                .foregroundStyle(Color.secondary)
            ProgressView(value: Double(viewModel.currentIndex + 1), total: Double(viewModel.questions.count))
                .tint(Color.ipAccent)
            Text(viewModel.progressText)
                .font(.caption)
                .foregroundStyle(Color.secondary)
        }
    }

    private func prompt(for sessionQuestion: QuizSessionQuestion) -> some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Question \(sessionQuestion.question.number)")
                .font(Typography.heading(size: .title3))
            Text(sessionQuestion.question.prompt)
                .font(.title3.weight(.medium))
                .foregroundStyle(Color.primary)
        }
    }

    private func imageCarousel(for sessionQuestion: QuizSessionQuestion) -> some View {
        TabView {
            ForEach(sessionQuestion.question.imageURLs, id: \.self) { url in
                AsyncImage(url: url) { phase in
                    switch phase {
                    case .empty:
                        ProgressView()
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                    case .success(let image):
                        image
                            .resizable()
                            .scaledToFit()
                            .frame(maxWidth: .infinity)
                            .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
                    case .failure:
                        VStack(spacing: 12) {
                            Image(systemName: "photo")
                                .font(.largeTitle)
                                .foregroundStyle(Color.secondary)
                            Text("Image unavailable")
                                .font(.caption)
                                .foregroundStyle(Color.secondary)
                        }
                        .frame(maxWidth: .infinity, minHeight: 200)
                    @unknown default:
                        EmptyView()
                    }
                }
                .frame(height: 260)
                .padding(.vertical, 4)
            }
        }
#if os(iOS)
        .tabViewStyle(.page)
#endif
        .frame(height: 280)
    }

    private func optionsList(for sessionQuestion: QuizSessionQuestion) -> some View {
        VStack(alignment: .leading, spacing: 12) {
            ForEach(sessionQuestion.question.options) { option in
                let isAnswered = viewModel.isAnswered(sessionQuestion)
                let isSelected = viewModel.isOptionSelected(option.id, for: sessionQuestion)
                let isCorrect = viewModel.isOptionCorrect(option.id, for: sessionQuestion)
                Button {
                    withAnimation(.easeInOut) {
                        viewModel.select(optionId: option.id)
                    }
                } label: {
                    HStack(alignment: .center, spacing: 12) {
                        Text(option.id.uppercased())
                            .font(.headline)
                            .frame(width: 32, height: 32)
                            .background(Circle().fill(Color.ipSurfaceElevated))
                        Text(option.text)
                            .font(.body)
                            .multilineTextAlignment(.leading)
                        Spacer()
                    }
                    .padding(16)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(choiceBackground(isAnswered: isAnswered, isSelected: isSelected, isCorrect: isCorrect))
                    .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
                    .overlay(
                        RoundedRectangle(cornerRadius: 16, style: .continuous)
                            .stroke(choiceBorder(isAnswered: isAnswered, isSelected: isSelected, isCorrect: isCorrect), lineWidth: 2)
                    )
                }
                .buttonStyle(.plain)
                .disabled(isAnswered)
                .accessibilityLabel(Text("Option \(option.id). \(option.text)"))
            }
        }
    }

    private func choiceBackground(isAnswered: Bool, isSelected: Bool, isCorrect: Bool) -> Color {
        if isAnswered {
            if isSelected {
                return isCorrect ? Color.green.opacity(0.18) : Color.red.opacity(0.18)
            }
            return isCorrect ? Color.green.opacity(0.12) : Color.ipSurface
        } else {
            return isSelected ? Color.ipSurfaceElevated.opacity(0.6) : Color.ipSurface
        }
    }

    private func choiceBorder(isAnswered: Bool, isSelected: Bool, isCorrect: Bool) -> Color {
        if isAnswered {
            if isSelected {
                return isCorrect ? Color.green : Color.red
            }
            return isCorrect ? Color.green : Color.clear
        }
        return isSelected ? Color.ipAccent : Color.clear
    }

    private func explanation(for sessionQuestion: QuizSessionQuestion) -> some View {
        let selected = viewModel.selection(for: sessionQuestion)
        let isCorrect = selected == sessionQuestion.question.correctOptionId
        return VStack(alignment: .leading, spacing: 12) {
            HStack(spacing: 8) {
                Image(systemName: isCorrect ? "checkmark.circle.fill" : "xmark.octagon.fill")
                    .foregroundStyle(isCorrect ? Color.green : Color.red)
                Text(isCorrect ? "Correct" : "Keep practicing")
                    .font(.headline)
                    .foregroundStyle(isCorrect ? Color.green : Color.red)
            }
            Text(sessionQuestion.question.explanation)
                .font(.body)
                .foregroundStyle(Color.primary)
            if !sessionQuestion.question.references.isEmpty {
                DisclosureGroup("References") {
                    VStack(alignment: .leading, spacing: 8) {
                        ForEach(sessionQuestion.question.references, id: \.self) { reference in
                            Text(reference)
                                .font(.footnote)
                                .foregroundStyle(Color.secondary)
                                .frame(maxWidth: .infinity, alignment: .leading)
                        }
                    }
                    .padding(.top, 4)
                }
                .font(.subheadline)
            }
        }
        .padding(16)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color.ipSurface)
        .clipShape(RoundedRectangle(cornerRadius: 18, style: .continuous))
    }

    private func controlBar(for sessionQuestion: QuizSessionQuestion) -> some View {
        let isAnswered = viewModel.isAnswered(sessionQuestion)
        let isLast = viewModel.currentIndex == viewModel.questions.count - 1
        return HStack {
            Spacer()
            Button(isLast ? "Finish Quiz" : "Next Question") {
                withAnimation(.spring(response: 0.4, dampingFraction: 0.8)) {
                    viewModel.advance()
                }
            }
            .buttonStyle(.borderedProminent)
            .disabled(!isAnswered)
        }
    }

    private var summaryView: some View {
        let total = max(viewModel.questions.count, 1)
        let correct = viewModel.score
        let percentage = Int((Double(correct) / Double(total)) * 100)
        let breakdown = moduleBreakdown()

        return ScrollView {
            VStack(alignment: .leading, spacing: 24) {
                VStack(alignment: .leading, spacing: 12) {
                    Text("Quick Start Summary")
                        .font(Typography.heading(size: .title2))
                    HStack(alignment: .lastTextBaseline, spacing: 12) {
                        Text("\(correct)")
                            .font(.system(size: 48, weight: .bold))
                        Text("out of \(total) correct")
                            .font(.title3.weight(.semibold))
                    }
                    Text("Score: \(percentage)% • Time: \(formattedDuration(viewModel.duration))")
                        .font(.subheadline)
                        .foregroundStyle(Color.secondary)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(20)
                .background(Color.ipSurface)
                .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))

                if !breakdown.isEmpty {
                    VStack(alignment: .leading, spacing: 12) {
                        Text("Module Breakdown")
                            .font(.headline)
                        ForEach(breakdown, id: \.module.id) { item in
                            HStack {
                                VStack(alignment: .leading) {
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
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(Color.ipSurface)
                    .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
                }

                Button {
                    viewModel.restart(limit: quickStartCount)
                } label: {
                    Text("Start New Quick Quiz")
                        .font(.body.weight(.semibold))
                        .frame(maxWidth: .infinity)
                }
                .buttonStyle(.borderedProminent)
            }
            .padding(24)
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .background(Color.ipBackground.ignoresSafeArea())
    }

    private func formattedDuration(_ interval: TimeInterval) -> String {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = interval >= 60 ? [.minute, .second] : [.second]
        formatter.unitsStyle = .abbreviated
        return formatter.string(from: interval) ?? "0s"
    }

    private func moduleBreakdown() -> [ModuleBreakdownItem] {
        let grouped = Dictionary(grouping: viewModel.questions) { $0.module.id }
        return grouped.compactMap { key, questions in
            guard let module = questions.first?.module else { return nil }
            let correct = questions.reduce(into: 0) { partialResult, sessionQuestion in
                if viewModel.selection(for: sessionQuestion) == sessionQuestion.question.correctOptionId {
                    partialResult += 1
                }
            }
            return ModuleBreakdownItem(module: module, correct: correct, total: questions.count)
        }.sorted { $0.module.summary.title < $1.module.summary.title }
    }
}

private struct ModuleBreakdownItem: Identifiable {
    let module: QuizModule
    let correct: Int
    let total: Int

    var id: String { module.id }
}
