import XCTest
@testable import iprep

final class QuizViewModelTests: XCTestCase {
    
    func testQuizSessionInitialization() throws {
        // Test that quiz sessions initialize correctly
        let viewModel = QuizViewModel()
        XCTAssertNotNil(viewModel)
    }
    
    func testQuestionBankService() throws {
        // Test question bank service functionality
        let service = QuestionBankService()
        XCTAssertGreaterThan(service.totalQuestionCount, 0)
        XCTAssertGreaterThan(service.moduleCount(), 0)
    }
    
    func testModuleDataStructure() throws {
        // Test that modules have required properties
        let service = QuestionBankService()
        let modules = service.moduleSummaries()
        
        for module in modules {
            XCTAssertFalse(module.id.isEmpty)
            XCTAssertFalse(module.title.isEmpty)
            XCTAssertGreaterThan(module.estimatedTimeMinutes, 0)
        }
    }
}
