import SwiftUI

struct QuizView: View {
    @EnvironmentObject private var environment: AppEnvironment
    @StateObject private var viewModel: QuizViewModel
    @State private var didConfigure = false
    @State private var didPrepareInitialSession = false
    @State private var quickStartCount: Int = 10

    private let mode: QuizMode

    init(mode: QuizMode = .quickStart(resume: false)) {
        self.mode = mode
        self._viewModel = StateObject(wrappedValue: QuizViewModel())
    }

    private var navigationTitle: String {
        switch mode {
        case .quickStart:
            return "Quiz"
        case let .module(_, title):
            return title
        case .incorrectOnly:
            return "Retry Incorrect"
        }
    }

    private var questionCountOptions: [Int] {
        func sanitizedOptions(upTo total: Int) -> [Int] {
            guard total > 0 else { return [5, 10, 15, 20] }
            let seeds = [5, 10, 15, 20, total]
            let filtered = Array(Set(seeds)).sorted().filter { $0 <= total }
            return filtered.isEmpty ? [total] : filtered
        }

        switch mode {
        case .quickStart:
            return [5, 10, 15, 20]
        case let .module(id, _):
            let total = environment.questionBankService.questions(forModule: id).count
            return sanitizedOptions(upTo: total)
        case .incorrectOnly:
            let total = environment.incorrectQuestionCount()
            return sanitizedOptions(upTo: total)
        }
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
                    Button("Try Again") {
                        startQuiz(initial: false)
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
        .navigationTitle(navigationTitle)
        .background(Color.ipBackground.ignoresSafeArea())
        .toolbar { questionCountToolbar }
        .task {
            if !didConfigure {
                viewModel.configure(
                    questionBank: environment.questionBankService,
                    localStore: environment.localStore
                )
                didConfigure = true
            }
            if !didPrepareInitialSession {
                adjustQuestionCountForMode()
                startQuiz(initial: true)
                didPrepareInitialSession = true
            }
        }
    }

    private var questionCountToolbar: some ToolbarContent {
        ToolbarItemGroup(placement: .topBarTrailing) {
            if !viewModel.questions.isEmpty {
                Menu {
                    ForEach(Array(viewModel.questions.enumerated()), id: \.offset) { index, question in
                        Button {
                            viewModel.jumpToQuestion(at: index)
                        } label: {
                            let status = viewModel.isAnswered(question) ? "✓" : ""
                            Text("Question \(index + 1) \(status)")
                        }
                    }
                } label: {
                    Image(systemName: "list.number")
                }
            }
            Menu {
                Picker("Number of Questions", selection: $quickStartCount) {
                    ForEach(questionCountOptions, id: \.self) { count in
                        Text("\(count) questions").tag(count)
                    }
                }
                Divider()
                Button("Start Over", role: .none) {
                    viewModel.restart(with: normalizedModeForRestart, limit: quickStartCount)
                }
            } label: {
                Image(systemName: "ellipsis.circle")
            }
        }
    }

    private var normalizedModeForRestart: QuizMode {
        switch mode {
        case .quickStart:
            return .quickStart(resume: false)
        case let .module(id, title):
            return .module(id: id, title: title)
        case .incorrectOnly:
            return .incorrectOnly
        }
    }

    private func adjustQuestionCountForMode() {
        guard let maxOption = questionCountOptions.max() else { return }
        quickStartCount = min(quickStartCount, maxOption)
    }

    private func startQuiz(initial: Bool) {
        adjustQuestionCountForMode()
        switch mode {
        case let .quickStart(resume):
            let action: QuizViewModel.InitialSessionAction = initial ? (resume ? .resumeIfAvailable : .startFresh) : .startFresh
            viewModel.prepareQuickStart(limit: quickStartCount, resumePreference: action)
        case let .module(id, _):
            viewModel.startModuleQuiz(moduleID: id, limit: quickStartCount)
        case .incorrectOnly:
            viewModel.startIncorrectOnly(limit: quickStartCount)
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
                            .frame(maxWidth: .infinity, maxHeight: 260)
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
                    VStack(alignment: .leading, spacing: 12) {
                        HStack(alignment: .top, spacing: 12) {
                            Text(option.id.uppercased())
                                .font(.headline)
                                .frame(width: 32, height: 32)
                                .background(Circle().fill(Color.ipSurfaceElevated))
                            if !option.text.isEmpty {
                                Text(option.text)
                                    .font(.body)
                                    .multilineTextAlignment(.leading)
                            }
                            Spacer()
                        }
                        if let imageURL = option.imageURL {
                            AsyncImage(url: imageURL) { phase in
                                switch phase {
                                case .empty:
                                    ProgressView()
                                        .frame(maxWidth: .infinity, minHeight: 140)
                                case .success(let image):
                                    image
                                        .resizable()
                                        .scaledToFit()
                                        .frame(maxWidth: .infinity, maxHeight: 140)
                                        .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
                                case .failure:
                                    Image(systemName: "photo")
                                        .font(.largeTitle)
                                        .foregroundStyle(Color.secondary)
                                        .frame(maxWidth: .infinity, minHeight: 120)
                                @unknown default:
                                    EmptyView()
                                }
                            }
                        }
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
                .accessibilityLabel(Text("Option \(option.id)" + (option.text.isEmpty ? " image" : ": \(option.text)")))
            }
        }
    }

    private func explanation(for sessionQuestion: QuizSessionQuestion) -> some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Explanation")
                .font(.headline)
            Text(sessionQuestion.question.explanation)
                .font(.body)
                .foregroundStyle(Color.secondary)
            if !sessionQuestion.question.explanationImageURLs.isEmpty {
                VStack(alignment: .leading, spacing: 12) {
                    ForEach(sessionQuestion.question.explanationImageURLs, id: \.self) { url in
                        AsyncImage(url: url) { phase in
                            switch phase {
                            case .empty:
                                ProgressView()
                                    .frame(maxWidth: .infinity, minHeight: 140)
                            case .success(let image):
                                image
                                    .resizable()
                                    .scaledToFit()
                                    .frame(maxWidth: .infinity, maxHeight: 200)
                                    .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
                            case .failure:
                                Image(systemName: "photo")
                                    .font(.largeTitle)
                                    .foregroundStyle(Color.secondary)
                                    .frame(maxWidth: .infinity, minHeight: 120)
                            @unknown default:
                                EmptyView()
                            }
                        }
                    }
                }
            }
            if !sessionQuestion.question.references.isEmpty {
                Divider()
                Text("References")
                    .font(.headline)
                ForEach(sessionQuestion.question.references, id: \.self) { reference in
                    Text(reference)
                        .font(.footnote)
                        .foregroundStyle(Color.secondary)
                }
            }
        }
        .padding(16)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color.ipSurface)
        .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
    }

    private func controlBar(for sessionQuestion: QuizSessionQuestion) -> some View {
        HStack(spacing: 12) {
            Button {
                viewModel.goBack()
            } label: {
                Label("Previous", systemImage: "arrow.left")
                    .font(.headline)
                    .frame(maxWidth: .infinity)
            }
            .buttonStyle(.bordered)
            .disabled(!viewModel.canGoBack)
            .opacity(viewModel.canGoBack ? 1 : 0.6)

            Button(action: viewModel.advance) {
                Label(viewModel.currentIndex + 1 == viewModel.questions.count ? "Finish" : "Next", systemImage: "arrow.right")
                    .font(.headline)
                    .frame(maxWidth: .infinity)
            }
            .buttonStyle(.borderedProminent)
            .disabled(!viewModel.isAnswered(sessionQuestion))
            .opacity(viewModel.isAnswered(sessionQuestion) ? 1 : 0.6)
        }
    }

    private func choiceBackground(isAnswered: Bool, isSelected: Bool, isCorrect: Bool) -> some View {
        RoundedRectangle(cornerRadius: 16, style: .continuous)
            .fill(backgroundColor(isAnswered: isAnswered, isSelected: isSelected, isCorrect: isCorrect))
    }

    private func backgroundColor(isAnswered: Bool, isSelected: Bool, isCorrect: Bool) -> Color {
        guard isAnswered else { return Color.ipSurface } 
        if isSelected {
            return isCorrect ? Color.green.opacity(0.25) : Color.red.opacity(0.2)
        }
        return isCorrect ? Color.green.opacity(0.15) : Color.ipSurface
    }

    private func choiceBorder(isAnswered: Bool, isSelected: Bool, isCorrect: Bool) -> Color {
        guard isAnswered else { return Color.clear }
        if isSelected {
            return isCorrect ? Color.green : Color.red
        }
        return isCorrect ? Color.green.opacity(0.7) : Color.clear
    }

    private var summaryView: some View {
        VStack(spacing: 20) {
            Image(systemName: "checkmark.seal.fill")
                .font(.system(size: 64))
                .foregroundStyle(Color.ipAccent)

            Text("Great work!")
                .font(Typography.heading(size: .title))

            VStack(spacing: 8) {
                Text("Score: \(viewModel.score)/\(viewModel.questions.count)")
                    .font(.title3.weight(.semibold))
                Text("Time: \(Int(viewModel.duration)) seconds")
                    .font(.subheadline)
                    .foregroundStyle(Color.secondary)
            }

            Button("Start Over") {
                viewModel.restart(with: normalizedModeForRestart, limit: quickStartCount)
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.ipBackground)
    }
}
