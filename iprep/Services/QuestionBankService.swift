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
                    let options = questionDTO.options.map { QuizOption(id: $0.id, text: $0.text) }
                    let urls: [URL] = questionDTO.imageURLs.compactMap { URL(string: $0) }
                    return QuizQuestion(
                        id: questionDTO.id,
                        number: questionDTO.number,
                        prompt: questionDTO.prompt,
                        options: options,
                        correctOptionId: questionDTO.correctOptionId,
                        explanation: questionDTO.explanation,
                        references: questionDTO.references,
                        imageURLs: urls
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

    func moduleSummaries() -> [Module] {
        modules.map { $0.summary }
    }

    func quizModule(for id: String) -> QuizModule? {
        modulesById[id]
    }

    func questions(forModule id: String) -> [QuizQuestion] {
        modulesById[id]?.questions ?? []
    }

    func quickStartQuestions(limit: Int = 10) -> [QuizSessionQuestion] {
        guard !modules.isEmpty else { return [] }
        var pool: [QuizSessionQuestion] = modules.flatMap { module in
            module.questions.map { QuizSessionQuestion(module: module, question: $0) }
        }
        pool.shuffle()
        return Array(pool.prefix(max(1, min(limit, pool.count))))
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
