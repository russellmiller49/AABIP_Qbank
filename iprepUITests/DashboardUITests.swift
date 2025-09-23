import XCTest

final class DashboardUITests: XCTestCase {
    
    var app: XCUIApplication!
    
    override func setUpWithError() throws {
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
    }
    
    func testDashboardNavigation() throws {
        // Test navigation to Dashboard
        let dashboardButton = app.buttons["Dashboard"]
        if dashboardButton.exists {
            dashboardButton.tap()
            
            // Verify we're on the dashboard
            XCTAssertTrue(app.navigationBars["Dashboard"].exists)
        }
    }
    
    func testReviewNavigation() throws {
        // Test navigation from Dashboard to Review
        let dashboardButton = app.buttons["Dashboard"]
        if dashboardButton.exists {
            dashboardButton.tap()
            
            // Look for Review button/link
            let reviewButton = app.buttons["Review"]
            if reviewButton.exists {
                reviewButton.tap()
                
                // Verify we're on the review screen
                XCTAssertTrue(app.navigationBars["Review"].exists)
            }
        }
    }
    
    func testQuickStartButton() throws {
        // Test Quick Start functionality
        let dashboardButton = app.buttons["Dashboard"]
        if dashboardButton.exists {
            dashboardButton.tap()
            
            let quickStartButton = app.buttons["Quick Start"]
            if quickStartButton.exists {
                quickStartButton.tap()
                // Should navigate to quiz
            }
        }
    }
}
