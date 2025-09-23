import Foundation
import OSLog

final class QuestionBankService {
    private struct QuestionBankDTO: Decodable {
        let modules: [ModuleDTO]
    }

    private struct ModuleDTO: Decodable {
        let id: String
        let title: String
        let description: String
        let estimatedTimeMinutes: Int
        let difficulty: String
        let questionCount: Int
        let questions: [QuestionDTO]
    }

    private struct QuestionDTO: Decodable {
        struct OptionDTO: Decodable {
            let id: String
            let text: String
        }

        let id: String
        let number: Int
        let prompt: String
        let options: [OptionDTO]
        let correctOptionId: String
        let explanation: String
        let references: [String]
        let imageURLs: [String]
    }

    private let modules: [QuizModule]
    private let modulesById: [String: QuizModule]
    let totalQuestionCount: Int
    private let logger: Logger

    init(
        bundle: Bundle = .module,
        logger: Logger = Logger(
            subsystem: (Bundle.main.bundleIdentifier ?? "com.russellmiller.iprep"),
            category: "QuestionBankService"
        )
    ) {
        self.logger = logger
        do {
            guard let url = bundle.url(forResource: "QuestionBank", withExtension: "json") else {
                throw NSError(
                    domain: "QuestionBankService",
                    code: 1,
                    userInfo: [NSLocalizedDescriptionKey: "QuestionBank.json missing from resources"]
                )
            }
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            let dto = try decoder.decode(QuestionBankDTO.self, from: data)
            let quizModules = dto.modules.map { moduleDTO -> QuizModule in
                let difficulty = Module.Difficulty(rawValue: moduleDTO.difficulty) ?? .moderate
                let summary = Module(
                    id: moduleDTO.id,
                    title: moduleDTO.title,
                    description: moduleDTO.description,
                    questionCount: moduleDTO.questions.count,
                    estimatedTimeMinutes: moduleDTO.estimatedTimeMinutes,
                    difficulty: difficulty
                )
                let questions = moduleDTO.questions.map { questionDTO -> QuizQuestion in
                    var promptText = questionDTO.prompt
                    var options = questionDTO.options.map {
                        QuizOption(id: $0.id.lowercased(), text: $0.text, imageURL: nil)
                    }
                    if options.isEmpty, let parsed = QuestionBankService.parseEmbeddedOptions(from: promptText) {
                        promptText = parsed.prompt
                        options = parsed.options
                    }

                    var promptImages: [URL] = []
                    var explanationImages: [URL] = []
                    var optionImageMap: [String: URL] = [:]

                    for urlString in questionDTO.imageURLs {
                        guard let url = URL(string: urlString) else { continue }
                        let lower = urlString.lowercased()
                        if let optionId = QuestionBankService.optionIdentifier(from: lower) {
                            optionImageMap[optionId] = url
                        } else if lower.contains("diss") || lower.contains("discuss") || lower.contains("explanation") {
                            explanationImages.append(url)
                        } else {
                            promptImages.append(url)
                        }
                    }

                    let normalizedOptions = options.map { option -> QuizOption in
                        let optionId = option.id.lowercased()
                        return QuizOption(
                            id: optionId,
                            text: option.text,
                            imageURL: optionImageMap[optionId]
                        )
                    }

                    return QuizQuestion(
                        id: questionDTO.id,
                        number: questionDTO.number,
                        prompt: promptText,
                        options: normalizedOptions,
                        correctOptionId: questionDTO.correctOptionId.lowercased(),
                        explanation: questionDTO.explanation,
                        references: questionDTO.references,
                        imageURLs: promptImages,
                        explanationImageURLs: explanationImages
                    )
                }
                return QuizModule(summary: summary, questions: questions)
            }
            self.modules = quizModules
            self.modulesById = Dictionary(uniqueKeysWithValues: quizModules.map { ($0.id, $0) })
            self.totalQuestionCount = quizModules.reduce(0) { $0 + $1.questions.count }
        } catch {
            self.logger.error("Failed to load question bank: \(error.localizedDescription, privacy: .public)")
            self.modules = []
            self.modulesById = [:]
            self.totalQuestionCount = 0
        }
    }

    private static func parseEmbeddedOptions(from prompt: String) -> (prompt: String, options: [QuizOption])? {
        let pattern = #" ([a-zA-Z])\)"#
        guard let regex = try? NSRegularExpression(pattern: pattern, options: []) else { return nil }
        let nsPrompt = prompt as NSString
        let matches = regex.matches(in: prompt, range: NSRange(location: 0, length: nsPrompt.length))
        guard !matches.isEmpty else { return nil }

        var parsedOptions: [QuizOption] = []
        for (index, match) in matches.enumerated() {
            let labelRange = match.range(at: 1)
            let label = nsPrompt.substring(with: labelRange).lowercased()
            let start = match.range.location + match.range.length
            let end: Int
            if index + 1 < matches.count {
                end = matches[index + 1].range.location
            } else {
                end = nsPrompt.length
            }
            let optionText = nsPrompt.substring(with: NSRange(location: start, length: end - start)).trimmingCharacters(in: .whitespacesAndNewlines)
            parsedOptions.append(QuizOption(id: label, text: optionText, imageURL: nil))
        }

        let questionText = nsPrompt.substring(to: matches[0].range.location).trimmingCharacters(in: .whitespacesAndNewlines)
        guard !parsedOptions.isEmpty, !questionText.isEmpty else { return nil }
        return (questionText, parsedOptions)
    }

    private static func optionIdentifier(from filename: String) -> String? {
        guard let range = filename.range(of: #"\(([a-z])\)"#, options: .regularExpression) else { return nil }
        let substring = filename[range]
        return substring.trimmingCharacters(in: CharacterSet(charactersIn: "() ")).lowercased()
    }

    func moduleSummaries() -> [Module] {
        modules.map { $0.summary }
    }

    func quizModule(for id: String) -> QuizModule? {
        modulesById[id]
    }

    func questions(forModule id: String) -> [QuizQuestion] {
        modulesById[id]?.questions ?? []
    }

    func quickStartQuestions(limit: Int = 10, excluding excludedIDs: Set<String> = []) -> [QuizSessionQuestion] {
        guard !modules.isEmpty else { return [] }
        let allQuestions: [QuizSessionQuestion] = modules.flatMap { module in
            module.questions.map { QuizSessionQuestion(module: module, question: $0) }
        }
        let filtered = allQuestions.filter { !excludedIDs.contains($0.question.id) }
        guard !filtered.isEmpty else { return [] }
        var pool = filtered
        pool.shuffle()
        return Array(pool.prefix(max(1, min(limit, pool.count))))
    }

    func sessionQuestions(forModule id: String) -> [QuizSessionQuestion] {
        guard let module = modulesById[id] else { return [] }
        return module.questions.map { QuizSessionQuestion(module: module, question: $0) }
    }

    func sessionQuestions(forModule id: String, excluding excludedIDs: Set<String>) -> [QuizSessionQuestion] {
        let base = sessionQuestions(forModule: id)
        guard !base.isEmpty else { return [] }
        let filtered = base.filter { !excludedIDs.contains($0.question.id) }
        return filtered.isEmpty ? [] : filtered
    }

    func sessionQuestion(for reference: QuizSessionQuestionReference) -> QuizSessionQuestion? {
        guard let module = modulesById[reference.moduleID],
              let question = module.questions.first(where: { $0.id == reference.questionID }) else {
            return nil
        }
        return QuizSessionQuestion(module: module, question: question)
    }

    func moduleCount() -> Int {
        modules.count
    }

    func sessionQuestions(from references: [QuizSessionQuestionReference]) -> [QuizSessionQuestion] {
        references.compactMap { reference in
            guard let module = modulesById[reference.moduleID],
                  let question = module.questions.first(where: { $0.id == reference.questionID }) else {
                return nil
            }
            return QuizSessionQuestion(module: module, question: question)
        }
    }
}
