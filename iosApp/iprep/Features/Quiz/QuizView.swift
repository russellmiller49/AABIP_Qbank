import SwiftUI
#if canImport(UIKit)
import UIKit
#endif

struct QuizView: View {
    @EnvironmentObject private var environment: AppEnvironment
    @Environment(\.scenePhase) private var scenePhase
    @StateObject private var viewModel: QuizViewModel
    @State private var didConfigure = false
    @State private var didPrepareInitialSession = false
    @State private var quickStartCount: Int = 10
    @State private var isNoteSheetPresented = false
    @State private var noteDraft: String = ""
    @State private var noteQuestionID: String?
    @State private var leaderboardOptIn = false

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
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                timerSummaryView
            }
            ToolbarItemGroup(placement: .topBarTrailing) {
                if !viewModel.questions.isEmpty {
                    Menu {
                        ForEach(Array(viewModel.questions.indices), id: \.self) { index in
                            let question = viewModel.questions[index]
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
                    Button("Daily review queue") {
                        viewModel.startReviewQueue(limit: quickStartCount)
                    }
                    Button("Fix my weak spots") {
                        viewModel.startAdaptiveDrill(limit: max(15, quickStartCount))
                    }
                } label: {
                    Image(systemName: "ellipsis.circle")
                }
                Menu {
                    Picker("Study Mode", selection: modeBinding) {
                        ForEach(QuizSessionMode.allCases) { mode in
                            Text(mode.title).tag(mode)
                        }
                    }
                    Toggle(isOn: perQuestionTimerBinding) {
                        Label("Per-question timer", systemImage: "clock.arrow.circlepath")
                    }
                    Toggle(isOn: autoPauseBinding) {
                        Label("Auto-pause on background", systemImage: "pause.circle")
                    }
                    Toggle(isOn: $leaderboardOptIn) {
                        Label("Opt into leaderboards", systemImage: "trophy")
                    }
                } label: {
                    Image(systemName: "gearshape")
                }
            }
        }
        .task {
            if !didConfigure {
                viewModel.configure(
                    questionBank: environment.questionBankService,
                    localStore: environment.localStore,
                    studyPlanner: environment.studyPlanner
                )
                leaderboardOptIn = environment.leaderboardOptIn()
                didConfigure = true
            }
            if !didPrepareInitialSession {
                adjustQuestionCountForMode()
                startQuiz(initial: true)
                didPrepareInitialSession = true
            }
        }
        .onChange(of: scenePhase) { _, newPhase in
            guard viewModel.configuration.autoPauseOnBackground else { return }
            switch newPhase {
            case .background, .inactive:
                viewModel.pauseTimer()
            case .active:
                viewModel.resumeTimer()
            default:
                break
            }
        }
        .onChange(of: leaderboardOptIn) { _, newValue in
            environment.setLeaderboardOptIn(newValue)
        }
        .sheet(isPresented: $isNoteSheetPresented) {
            if let questionID = noteQuestionID,
               let question = viewModel.questions.first(where: { $0.question.id == questionID }) {
                NoteEditor(
                    note: $noteDraft,
                    question: question,
                    onSave: {
                        viewModel.updateNote(noteDraft, for: question)
                    },
                    exportHandler: { format in
                        exportURL(for: question, format: format)
                    }
                )
            } else {
                Text("No question selected")
                    .presentationDetents([.medium])
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
        VStack(spacing: 16) {
            sessionControls
            ScrollView {
                VStack(alignment: .leading, spacing: 24) {
                    header(for: sessionQuestion)
                    prompt(for: sessionQuestion)
                    if !sessionQuestion.question.imageURLValues.isEmpty {
                        imageCarousel(for: sessionQuestion)
                    }
                    optionsList(for: sessionQuestion)
                    confidenceChips(for: sessionQuestion)
                    noteToolbar(for: sessionQuestion)
                    if shouldShowExplanation(for: sessionQuestion) {
                        explanation(for: sessionQuestion)
                    }
                    controlBar(for: sessionQuestion)
                }
                .padding(20)
                .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
        .padding(.horizontal, 16)
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

    private var sessionControls: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack(spacing: 12) {
                Label(formattedTime(viewModel.elapsedSeconds), systemImage: "clock")
                    .font(.headline)
                if viewModel.configuration.perQuestionTimerEnabled {
                    Text("Question: \(formattedTime(viewModel.currentQuestionSeconds))")
                        .font(.subheadline)
                        .padding(.horizontal, 10)
                        .padding(.vertical, 4)
                        .background(Capsule().fill(Color.ipSurface))
                }
                Spacer()
                Button {
                    if viewModel.isTimerPaused {
                        viewModel.resumeTimer()
                    } else {
                        viewModel.pauseTimer()
                    }
                } label: {
                    Label(viewModel.isTimerPaused ? "Resume" : "Pause", systemImage: viewModel.isTimerPaused ? "play.fill" : "pause.fill")
                }
                .buttonStyle(.bordered)
                .disabled(viewModel.state != .ready)
            }

            Text(viewModel.configuration.mode.description)
                .font(.footnote)
                .foregroundStyle(Color.secondary)
        }
        .padding(16)
        .background(Color.ipSurface)
        .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
    }

    private func shouldShowExplanation(for sessionQuestion: QuizSessionQuestion) -> Bool {
        guard viewModel.isAnswered(sessionQuestion) else { return false }
        return viewModel.configuration.mode == .study || viewModel.state == .completed
    }

    private func flagButton(for sessionQuestion: QuizSessionQuestion) -> some View {
        let studyState = viewModel.studyState(for: sessionQuestion)
        let isFlagged = studyState.flagged
        return Button {
            viewModel.toggleFlag(for: sessionQuestion)
        } label: {
            Image(systemName: isFlagged ? "flag.fill" : "flag")
                .foregroundStyle(isFlagged ? Color.orange : Color.secondary)
                .padding(8)
        }
        .accessibilityLabel(isFlagged ? "Remove flag" : "Flag question")
    }

    private func confidenceChips(for sessionQuestion: QuizSessionQuestion) -> some View {
        let current = viewModel.studyState(for: sessionQuestion).confidence
        return VStack(alignment: .leading, spacing: 12) {
            Text("Confidence")
                .font(.headline)
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 110), spacing: 12)], spacing: 12) {
                ForEach(QuestionStudyState.Confidence.allCases) { confidence in
                    ConfidenceChip(
                        confidence: confidence,
                        isSelected: confidence == current,
                        action: {
                            let newValue = confidence == current ? nil : confidence
                            viewModel.setConfidence(newValue, for: sessionQuestion)
                        }
                    )
                }
            }
        }
    }

    private func noteToolbar(for sessionQuestion: QuizSessionQuestion) -> some View {
        let note = viewModel.studyState(for: sessionQuestion).noteMarkdown
        return VStack(alignment: .leading, spacing: 8) {
            HStack {
                Label("Notes", systemImage: "note.text")
                    .font(.headline)
                Spacer()
                Button {
                    noteQuestionID = sessionQuestion.question.id
                    noteDraft = note
                    isNoteSheetPresented = true
                } label: {
                    HStack(spacing: 6) {
                        Image(systemName: "square.and.pencil")
                        Text(note.isEmpty ? "Add" : "Edit")
                    }
                }
                .buttonStyle(.borderedProminent)
                .tint(Color.ipAccent)
            }
            if !note.isEmpty {
               Text(note)
                    .font(.footnote)
                    .foregroundStyle(Color.secondary)
                    .lineLimit(4)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(12)
                    .background(
                        RoundedRectangle(cornerRadius: 12, style: .continuous)
                            .fill(Color.ipSurface)
                    )
            }
        }
    }

    private func makeTimerStatusView() -> some View {
        HStack(spacing: 8) {
            Label(formattedShortTime(viewModel.elapsedSeconds), systemImage: "clock")
                .font(.subheadline)
            if viewModel.configuration.perQuestionTimerEnabled {
                Text(formattedShortTime(viewModel.currentQuestionSeconds))
                    .font(.caption)
                    .padding(.horizontal, 8)
                    .padding(.vertical, 4)
                    .background(Capsule().fill(Color.ipSurface))
            }
        }
    }

    private var timerSummaryView: some View {
        makeTimerStatusView()
    }

    private var modeBinding: Binding<QuizSessionMode> {
        Binding(
            get: { viewModel.configuration.mode },
            set: { newValue in
                var configuration = viewModel.configuration
                configuration.mode = newValue
                viewModel.updateConfiguration(configuration)
            }
        )
    }

    private var perQuestionTimerBinding: Binding<Bool> {
        Binding(
            get: { viewModel.configuration.perQuestionTimerEnabled },
            set: { newValue in
                var configuration = viewModel.configuration
                configuration.perQuestionTimerEnabled = newValue
                viewModel.updateConfiguration(configuration)
            }
        )
    }

    private var autoPauseBinding: Binding<Bool> {
        Binding(
            get: { viewModel.configuration.autoPauseOnBackground },
            set: { newValue in
                var configuration = viewModel.configuration
                configuration.autoPauseOnBackground = newValue
                viewModel.updateConfiguration(configuration)
            }
        )
    }

    private func formattedTime(_ seconds: TimeInterval) -> String {
        let totalSeconds = Int(seconds.rounded())
        let minutes = totalSeconds / 60
        let secs = totalSeconds % 60
        return String(format: "%02d:%02d", minutes, secs)
    }

    private func formattedShortTime(_ seconds: TimeInterval) -> String {
        formattedTime(seconds)
    }

    private enum NotesExportFormat: String, CaseIterable, Identifiable {
        case markdown
        case csv
        case pdf

        var id: String { rawValue }

        var title: String {
            switch self {
            case .markdown:
                return "Markdown"
            case .csv:
                return "CSV"
            case .pdf:
                return "PDF"
            }
        }

        var fileExtension: String {
            switch self {
            case .markdown:
                return "md"
            case .csv:
                return "csv"
            case .pdf:
                return "pdf"
            }
        }
    }

    private func exportURL(for question: QuizSessionQuestion, format: NotesExportFormat) -> URL? {
        let note = viewModel.studyState(for: question).noteMarkdown
        let directory = FileManager.default.temporaryDirectory.appendingPathComponent("AABIPNotes", isDirectory: true)
        do {
            try FileManager.default.createDirectory(at: directory, withIntermediateDirectories: true)
        } catch {
            return nil
        }
        let sanitized = question.question.id.replacingOccurrences(of: " ", with: "-")
        let url = directory.appendingPathComponent("\(sanitized).\(format.fileExtension)")
        let markdown = markdownExport(for: question, note: note)
        switch format {
        case .markdown:
            do {
                try markdown.write(to: url, atomically: true, encoding: .utf8)
                return url
            } catch {
                return nil
            }
        case .csv:
            let escapedPrompt = csvEscape(question.question.prompt)
            let escapedNote = csvEscape(note)
            let csv = "Question,Module,Confidence,Note\n\(escapedPrompt),\(csvEscape(question.module.summary.title)),\(viewModel.studyState(for: question).confidence?.title ?? ""),\(escapedNote)\n"
            do {
                try csv.write(to: url, atomically: true, encoding: .utf8)
                return url
            } catch {
                return nil
            }
        case .pdf:
#if canImport(UIKit)
            let renderer = UIGraphicsPDFRenderer(bounds: CGRect(x: 0, y: 0, width: 612, height: 792))
            let data = renderer.pdfData { context in
                context.beginPage()
                let textRect = CGRect(x: 32, y: 32, width: 548, height: 728)
                let paragraph = NSMutableParagraphStyle()
                paragraph.lineBreakMode = .byWordWrapping
                let attributes: [NSAttributedString.Key: Any] = [
                    .font: UIFont.preferredFont(forTextStyle: .body),
                    .paragraphStyle: paragraph
                ]
                let attributed = NSAttributedString(string: markdown, attributes: attributes)
                attributed.draw(in: textRect)
            }
            do {
                try data.write(to: url)
                return url
            } catch {
                return nil
            }
#else
            do {
                try markdown.write(to: url, atomically: true, encoding: .utf8)
                return url
            } catch {
                return nil
            }
#endif
        }
    }

    private func markdownExport(for question: QuizSessionQuestion, note: String) -> String {
        let confidence = viewModel.studyState(for: question).confidence?.title ?? "Unrated"
        return """
        # Question \(question.question.number)
        Module: \(question.module.summary.title)
        Confidence: \(confidence)

        ## Prompt
        \(question.question.prompt)

        ## Notes
        \(note.isEmpty ? "No notes yet." : note)
        """
    }

    private func csvEscape(_ value: String) -> String {
        let escaped = value.replacingOccurrences(of: "\"", with: "\"\"")
        return "\"\(escaped)\""
    }

    private struct NoteEditor: View {
        @Environment(\.dismiss) private var dismiss
        @Binding var note: String
        let question: QuizSessionQuestion
        let onSave: () -> Void
        let exportHandler: (NotesExportFormat) -> URL?

        var body: some View {
            NavigationStack {
                VStack(alignment: .leading, spacing: 16) {
                    formattingToolbar
                    TextEditor(text: $note)
                        .frame(minHeight: 220)
                        .overlay(
                            RoundedRectangle(cornerRadius: 12)
                                .stroke(Color.ipSurface, lineWidth: 1)
                        )
                    Spacer(minLength: 12)
                    exportMenu
                }
                .padding()
                .navigationTitle("Notes")
                .toolbar {
                    ToolbarItem(placement: .cancellationAction) {
                        Button("Cancel") { dismiss() }
                    }
                    ToolbarItem(placement: .confirmationAction) {
                        Button("Save") {
                            onSave()
                            dismiss()
                        }
                    }
                }
            }
            .presentationDetents([.medium, .large])
        }

        private var formattingToolbar: some View {
            HStack(spacing: 12) {
                Button {
                    note.append("**Bold text**")
                } label: {
                    Label("Bold", systemImage: "bold")
                }
                Button {
                    note.append("*Italic text*")
                } label: {
                    Label("Italic", systemImage: "italic")
                }
                Button {
                    note.append("==Highlight==")
                } label: {
                    Label("Highlight", systemImage: "highlighter")
                }
#if canImport(UIKit)
                Button {
                    UIPasteboard.general.string = note
                } label: {
                    Label("Copy", systemImage: "doc.on.doc")
                }
#endif
            }
            .labelStyle(.iconOnly)
            .buttonStyle(.bordered)
        }

        private var exportMenu: some View {
            Menu {
                ForEach(NotesExportFormat.allCases) { format in
                    if let url = exportHandler(format) {
                        ShareLink(item: url) {
                            Label(format.title, systemImage: "square.and.arrow.up")
                        }
                    }
                }
            } label: {
                Label("Export", systemImage: "square.and.arrow.up")
                    .frame(maxWidth: .infinity)
            }
            .buttonStyle(.borderedProminent)
        }
    }

    private func prompt(for sessionQuestion: QuizSessionQuestion) -> some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack(alignment: .top) {
                Text("Question \(sessionQuestion.question.number)")
                    .font(Typography.heading(size: .title3))
                Spacer()
                flagButton(for: sessionQuestion)
            }
            Text(sessionQuestion.question.prompt)
                .font(.title3.weight(.medium))
                .foregroundStyle(Color.primary)
        }
    }

    private func imageCarousel(for sessionQuestion: QuizSessionQuestion) -> some View {
        TabView {
            ForEach(sessionQuestion.question.imageURLValues, id: \.self) { url in
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
                        if let imageURL = option.imageURLValue {
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
            if !sessionQuestion.question.explanationImageURLValues.isEmpty {
                VStack(alignment: .leading, spacing: 12) {
                    ForEach(sessionQuestion.question.explanationImageURLValues, id: \.self) { url in
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
                Text("Time: \(formattedTime(viewModel.duration))")
                    .font(.subheadline)
                    .foregroundStyle(Color.secondary)
            }

            if leaderboardOptIn, let snapshot = environment.leaderboardSnapshot(), !snapshot.domains.isEmpty {
                VStack(alignment: .leading, spacing: 12) {
                    HStack {
                        Label("Weekly leaderboard", systemImage: "trophy")
                            .font(.headline)
                        Spacer()
                    }
                    HStack {
                        VStack(alignment: .leading, spacing: 2) {
                            Text(snapshot.alias)
                                .font(.caption.weight(.semibold))
                            Text("ID: \(snapshot.participantID.prefix(8))…")
                                .font(.caption2.monospacedDigit())
                                .foregroundStyle(Color.secondary)
                        }
                        Spacer()
                    }
                    ForEach(snapshot.domains) { domain in
                        HStack {
                            VStack(alignment: .leading, spacing: 4) {
                                Text(domain.title)
                                    .font(.subheadline.weight(.semibold))
                                Text("Accuracy: \(Int(domain.accuracy * 100))% • Percentile: \(Int(domain.percentile * 100))th")
                                    .font(.caption)
                                    .foregroundStyle(Color.secondary)
                            }
                            Spacer()
                        }
                        .padding(12)
                        .background(Color.ipSurface)
                        .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
                    }
                }
                .frame(maxWidth: 420)
            }

            Button("Start Over") {
                viewModel.restart(with: normalizedModeForRestart, limit: quickStartCount)
            }
            .buttonStyle(.borderedProminent)
            Button("Review weak areas") {
                viewModel.startAdaptiveDrill(limit: max(15, quickStartCount))
            }
            .buttonStyle(.bordered)
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.ipBackground)
    }
}


private struct ConfidenceChip: View {
    let confidence: QuestionStudyState.Confidence
    let isSelected: Bool
    let action: () -> Void

    private var selectedBackground: Color { Color.ipAccent.opacity(0.22) }
    private var deselectedBackground: Color { Color.ipSurface }
    private var borderColor: Color { isSelected ? Color.ipAccent.opacity(0.6) : Color.clear }

    var body: some View {
        Button(action: action) {
            HStack(spacing: 8) {
                Image(systemName: confidence.iconName)
                Text(confidence.title)
            }
            .font(.subheadline.weight(.semibold))
            .foregroundStyle(isSelected ? Color.ipAccent : Color.primary)
            .padding(.horizontal, 16)
            .padding(.vertical, 10)
            .frame(maxWidth: .infinity)
            .background(
                RoundedRectangle(cornerRadius: 16, style: .continuous)
                    .fill(isSelected ? selectedBackground : deselectedBackground)
            )
            .overlay(
                RoundedRectangle(cornerRadius: 16, style: .continuous)
                    .stroke(borderColor, lineWidth: isSelected ? 1.5 : 1.0)
            )
        }
        .buttonStyle(.plain)
    }
}
