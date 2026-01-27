import Foundation
import Shared

protocol StudyPlannerType: AnyObject {
    func reviewQueue(limit: Int) -> [QuizSessionQuestion]
    func adaptiveDrill(limit: Int) -> [QuizSessionQuestion]
}

final class StudyPlanner: StudyPlannerType {
    private let questionBank: QuestionBankService
    private let localStore: LocalStoreType
    private var questionReferenceLookup: [String: QuizSessionQuestionReference]

    init(questionBank: QuestionBankService, localStore: LocalStoreType) {
        self.questionBank = questionBank
        self.localStore = localStore
        var lookup: [String: QuizSessionQuestionReference] = [:]
        for module in questionBank.moduleSummaries() {
            let sessionQuestions = questionBank.sessionQuestions(forModule: module.id)
            for question in sessionQuestions {
                lookup[question.question.id] = QuizSessionQuestionReference(moduleID: module.id, questionID: question.question.id)
            }
        }
        self.questionReferenceLookup = lookup
    }

    func reviewQueue(limit: Int) -> [QuizSessionQuestion] {
        let states = localStore.allStudyStates()
        let dueQuestions = Array(
            states
                .filter { $0.value.needsReview }
                .sorted(by: { (lhs: (key: String, value: QuestionStudyState), rhs: (key: String, value: QuestionStudyState)) -> Bool in
                    let leftDate = lhs.value.dueAt ?? Date.distantPast
                    let rightDate = rhs.value.dueAt ?? Date.distantPast
                    return leftDate < rightDate
                })
                .prefix(limit)
        )
        if dueQuestions.isEmpty {
            // Fall back to unseen questions to seed the queue.
            let answered = localStore.answeredQuestionIDs()
            return questionBank.quickStartQuestions(limit: limit, excluding: answered)
        }
        let references = dueQuestions.compactMap { reference(for: $0.key) }
        let restored = questionBank.sessionQuestions(from: references)
        if restored.count < limit {
            let remaining = limit - restored.count
            let topUp = questionBank.quickStartQuestions(limit: remaining)
            return restored + topUp
        }
        return restored
    }

    func adaptiveDrill(limit: Int) -> [QuizSessionQuestion] {
        let sessions = localStore.completedQuizSessions()
        guard !sessions.isEmpty else {
            return questionBank.quickStartQuestions(limit: limit)
        }
        var moduleScores: [String: (correct: Int, total: Int)] = [:]
        for session in sessions {
            for reference in session.questionReferences {
                guard let sessionQuestion = questionBank.sessionQuestion(for: reference) else { continue }
                let questionID = sessionQuestion.question.id
                let selected = session.selections[questionID]
                var entry = moduleScores[reference.moduleID, default: (0, 0)]
                entry.total += 1
                if selected == sessionQuestion.question.correctOptionId {
                    entry.correct += 1
                }
                moduleScores[reference.moduleID] = entry
            }
        }

        let sortedModules = moduleScores
            .map { key, value -> (moduleID: String, accuracy: Double) in
                let accuracy = value.total == 0 ? 0 : Double(value.correct) / Double(value.total)
                return (key, accuracy)
            }
            .sorted { lhs, rhs in
                lhs.accuracy < rhs.accuracy
            }

        var questions: [QuizSessionQuestion] = []
        for module in sortedModules {
            let moduleQuestions = questionBank.sessionQuestions(forModule: module.moduleID)
            for question in moduleQuestions.shuffled() {
                if questions.contains(where: { $0.id == question.id }) { continue }
                questions.append(question)
                if questions.count >= limit { break }
            }
            if questions.count >= limit { break }
        }

        if questions.count < limit {
            let topUp = questionBank.quickStartQuestions(limit: limit - questions.count)
            for question in topUp where !questions.contains(where: { $0.id == question.id }) {
                questions.append(question)
                if questions.count >= limit { break }
            }
        }

        return questions
    }

    private func reference(for questionID: String) -> QuizSessionQuestionReference? {
        if let existing = questionReferenceLookup[questionID] {
            return existing
        }
        for module in questionBank.moduleSummaries() {
            let sessionQuestions = questionBank.sessionQuestions(forModule: module.id)
            if let match = sessionQuestions.first(where: { $0.question.id == questionID }) {
                let reference = QuizSessionQuestionReference(moduleID: match.module.id, questionID: match.question.id)
                questionReferenceLookup[questionID] = reference
                return reference
            }
        }
        return nil
    }
}
