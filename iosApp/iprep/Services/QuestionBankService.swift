import Foundation
import OSLog
import Shared

final class QuestionBankService {
    private let core: Shared.QuestionBankService
    private let logger: Logger

    init(
        core: Shared.QuestionBankService,
        logger: Logger = Logger(
            subsystem: (Bundle.main.bundleIdentifier ?? "com.russellmiller.iprep"),
            category: "QuestionBankService"
        )
    ) {
        self.core = core
        self.logger = logger
        if core.moduleSummaries().isEmpty {
            logger.warning("Shared question bank returned no modules; check QuestionBank.json bundling")
        }
    }

    var totalQuestionCount: Int {
        Int(core.totalQuestionCount)
    }

    func moduleSummaries() -> [Module] {
        core.moduleSummaries()
    }

    func quizModule(for id: String) -> QuizModule? {
        core.quizModule(id: id)
    }

    func questions(forModule id: String) -> [QuizQuestion] {
        core.questions(moduleId: id)
    }

    func quickStartQuestions(limit: Int = 10, excluding excludedIDs: Set<String> = []) -> [QuizSessionQuestion] {
        core.quickStartQuestions(limit: Int32(limit), excluding: excludedIDs)
    }

    func allSessionQuestions() -> [QuizSessionQuestion] {
        core.allSessionQuestions()
    }

    func sessionQuestions(forModule id: String) -> [QuizSessionQuestion] {
        core.sessionQuestions(forModule: id)
    }

    func sessionQuestions(forModule id: String, excluding excludedIDs: Set<String>) -> [QuizSessionQuestion] {
        core.sessionQuestions(forModule: id, excluding: excludedIDs)
    }

    func sessionQuestion(for reference: QuizSessionQuestionReference) -> QuizSessionQuestion? {
        core.sessionQuestion(reference: sharedReference(from: reference))
    }

    func moduleCount() -> Int {
        Int(core.moduleCount())
    }

    func sessionQuestions(from references: [QuizSessionQuestionReference]) -> [QuizSessionQuestion] {
        let sharedReferences = references.map(sharedReference(from:))
        return core.sessionQuestions(from: sharedReferences)
    }

    private func sharedReference(from reference: QuizSessionQuestionReference) -> Shared.QuizSessionQuestionReference {
        Shared.QuizSessionQuestionReference(moduleID: reference.moduleID, questionID: reference.questionID)
    }
}
