//
//  TodoUITests.swift
//  TodoUITests
//
//  Created by JIRATH EAKTHITIWORRANUN on 23/11/2563 BE.
//  Copyright © 2563 YiGu. All rights reserved.
//

import XCTest

class TodoUITests: XCTestCase {
    
    private lazy var app = XCUIApplication()
    private lazy var safari = XCUIApplication(bundleIdentifier: "com.apple.mobilesafari")
    
    override func setUp() {
        continueAfterFailure = false
        app.launch()
    }
    
    override func tearDown() {
        print(app.debugDescription)
    }
    
    func test_TODO_001() {
        XCTContext.runActivity(named: "Test go to new todo and type text") { _ in
            app.buttons["+"].tap()
            app.textFields["todoTitleLabel2"].tap()
            app.textFields["todoTitleLabel2"].typeText("test 101")
            app.buttons.matching(NSPredicate(format: "label CONTAINS 'shopping' or label CONTAINS 'phone'")).firstMatch.tap()
        }
    }
    
    func test_TODO_102() {
        safari.launch()
        app.activate()
    }
    
//    func test_TODO_103() {
//        //        app.cells.containing(NSPredicate(format: "label CONTAINS 'Disney'")).firstMatch.tap()
//        app.cells.containing(.staticText, identifier: "Go to Disney").firstMatch.tap()
//    }
    
}
