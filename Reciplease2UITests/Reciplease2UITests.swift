//
//  Reciplease2UITests.swift
//  Reciplease2UITests
//
//  Created by Pierre on 15/07/2022.
//

import XCTest

class Reciplease2UITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {

        let app = XCUIApplication()
        app.launch()
        app.textFields["Lemon, Cheese, Sausages..."].tap()
        
        let addStaticText = app/*@START_MENU_TOKEN@*/.staticTexts["Add"]/*[[".buttons[\"Add\"].staticTexts[\"Add\"]",".staticTexts[\"Add\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        addStaticText.tap()
        addStaticText.tap()
        app/*@START_MENU_TOKEN@*/.staticTexts["Search for recipes"]/*[[".buttons[\"Search for recipes\"].staticTexts[\"Search for recipes\"]",".staticTexts[\"Search for recipes\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()

    }
    
    func test2() throws {
        
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
