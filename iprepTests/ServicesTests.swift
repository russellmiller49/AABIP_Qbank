import XCTest
@testable import iprep

final class ServicesTests: XCTestCase {
    
    func testFirestoreServiceMock() throws {
        // Test FirestoreService mock implementation
        let questionBank = QuestionBankService()
        let firestoreService = FirestoreService(questionBank: questionBank)
        
        // Test async functionality
        let expectation = XCTestExpectation(description: "Fetch modules")
        
        Task {
            do {
                let modules = try await firestoreService.fetchModules()
                XCTAssertFalse(modules.isEmpty)
                expectation.fulfill()
            } catch {
                XCTFail("Failed to fetch modules: \(error)")
            }
        }
        
        wait(for: [expectation], timeout: 5.0)
    }
    
    func testLocalStore() throws {
        // Test local storage functionality
        let localStore = LocalStore()
        XCTAssertNotNil(localStore)
    }
    
    func testFeatureFlags() throws {
        // Test feature flag system
        let featureFlags = FeatureFlags()
        XCTAssertNotNil(featureFlags)
    }
}
