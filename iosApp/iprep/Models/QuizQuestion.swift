import Foundation
import Shared

typealias QuizOption = Shared.QuizOption
typealias QuizQuestion = Shared.QuizQuestion
typealias QuizModule = Shared.QuizModule
typealias QuizSessionQuestion = Shared.QuizSessionQuestion

extension QuizOption: Identifiable {}

extension QuizQuestion: Identifiable {}

extension QuizModule: Identifiable {}

extension QuizSessionQuestion: Identifiable {}

extension QuizOption {
    var imageURLValue: URL? {
        imageURL.flatMap(URL.init(string:))
    }
}

extension QuizQuestion {
    var imageURLValues: [URL] {
        imageURLs.compactMap(URL.init(string:))
    }

    var explanationImageURLValues: [URL] {
        explanationImageURLs.compactMap(URL.init(string:))
    }
}
