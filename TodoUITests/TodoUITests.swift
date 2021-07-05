//
//  TodoUITests.swift
//  TodoUITests
//
//  Created by JIRATH EAKTHITIWORRANUN on 5/7/2564 BE.
//  Copyright © 2564 BE YiGu. All rights reserved.
//

import XCTest

class TodoUITests: XCTestCase {
    
    let app = XCUIApplication()
    let safari = XCUIApplication(bundleIdentifier: "com.apple.mobilesafari")
    
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
        XCTContext.runActivity(named: "testExample") { _ in
            // UI tests must launch the application that they test.
            app.launch()
            // Use recording to get started writing UI tests.
            // Use XCTAssert and related functions to verify your tests produce the correct results.
            XCTContext.runActivity(named: "todo list screen") { _ in
                app.buttons["+"].tap()
            }
            XCTContext.runActivity(named: "todo detail screen") { _ in
                app.textFields["tfTodoTitle2"].tap()
                app.textFields["tfTodoTitle2"].typeText("test 101")
                app.buttons.matching(NSPredicate(format: "label CONTAINS 'shopping'")).firstMatch.tap()
                app.buttons.matching(identifier: "phone").element(boundBy: 0).tap()
            }
        }
    }
    
    func testSafari() throws {
        app.launch()
        safari.launch()
        sleep(5)
        if safari.buttons["URL"].exists {
            safari.buttons["URL"].tap()
        } else {
            safari.textFields["URL"].tap()
        }
        safari.textFields.element(boundBy: 0).typeText("test")
    }
}
