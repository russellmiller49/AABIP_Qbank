import XCTest
@testable import iprep

final class ModelsTests: XCTestCase {
    
    func testModuleModel() throws {
        // Test Module model structure
        let module = Module(
            id: "test-module",
            title: "Test Module",
            estimatedTimeMinutes: 30,
            questionCount: 10
        )
        
        XCTAssertEqual(module.id, "test-module")
        XCTAssertEqual(module.title, "Test Module")
        XCTAssertEqual(module.estimatedTimeMinutes, 30)
        XCTAssertEqual(module.questionCount, 10)
    }
    
    func testQuizQuestionModel() throws {
        // Test QuizQuestion model
        let option1 = QuizOption(id: "a", text: "Option A")
        let option2 = QuizOption(id: "b", text: "Option B")
        
        let question = QuizQuestion(
            id: "test-question",
            prompt: "What is the correct answer?",
            options: [option1, option2],
            correctOptionId: "a",
            explanation: "This is the correct answer",
            references: ["Reference 1", "Reference 2"]
        )
        
        XCTAssertEqual(question.id, "test-question")
        XCTAssertEqual(question.prompt, "What is the correct answer?")
        XCTAssertEqual(question.options.count, 2)
        XCTAssertEqual(question.correctOptionId, "a")
        XCTAssertEqual(question.references.count, 2)
    }
    
    func testAppRouteModel() throws {
        // Test AppRoute enum
        let dashboardRoute = AppRoute.dashboard
        let quizRoute = AppRoute.quiz(.quickStart(resume: false))
        let reviewRoute = AppRoute.review
        
        XCTAssertNotNil(dashboardRoute)
        XCTAssertNotNil(quizRoute)
        XCTAssertNotNil(reviewRoute)
    }
}
