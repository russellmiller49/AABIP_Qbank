import Foundation

struct QuizOption: Identifiable, Hashable {
    let id: String
    let text: String
}

struct QuizQuestion: Identifiable, Hashable {
    let id: String
    let number: Int
    let prompt: String
    let options: [QuizOption]
    let correctOptionId: String
    let explanation: String
    let references: [String]
    let imageURLs: [URL]

    func option(withId id: String) -> QuizOption? {
        options.first { $0.id == id }
    }
}

struct QuizModule: Identifiable, Hashable {
    let summary: Module
    let questions: [QuizQuestion]

    var id: String { summary.id }
}

struct QuizSessionQuestion: Identifiable, Hashable {
    let module: QuizModule
    let question: QuizQuestion

    var id: String { question.id }
}
