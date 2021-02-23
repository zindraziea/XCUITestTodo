//
//  TodoUITests.swift
//  TodoUITests
//
//  Created by Thannaphat Atinonthanakorn on 12/1/2564 BE.
//  Copyright © 2564 BE YiGu. All rights reserved.
//

import XCTest

class TodoUITests: XCTestCase {

    let app = XCUIApplication()
    let safari = XCUIApplication(bundleIdentifier: "com.apple.mobilesafari")
    let fastEasy = XCUIApplication(bundleIdentifier: "com.scb.iphone.enterprise.sit.scbapp")
    
    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    override func tearDownWithError() throws {
        print(app.debugDescription)
    }

    func testExample() throws {
        app.launch()
        app.activate()
        app.buttons["+"].tap()
        app.textFields["tfTodoTitle2"].tap()
    }
    
    func testSafari() {
        app.launch()
        safari.launch()
        safari.buttons["URL"].tap()
        fastEasy.launch()
    }
}
