//
//  TodoUITests.swift
//  TodoUITests
//
//  Created by JIRATH EAKTHITIWORRANUN on 8/10/2563 BE.
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
    
    func testExample() {
        XCTContext.runActivity(named: "Go to detail screen") { _ in
            app.buttons["+"].tap()
        }
        XCTContext.runActivity(named: "Input todo label") { _ in
            app.textFields["todoLabel2"].tap()
            app.textFields["todoLabel2"].typeText("test 101")
        }
    }
    
    func testSafari() {
        safari.launch()
        app.activate()
    }
    
    func testQuery() {
        //        app.buttons.matching(NSPredicate(format: "label = 'Edit'")).firstMatch.tap()
        //        app.buttons.matching(NSPredicate(format: "label CONTAINS 'Ed'")).firstMatch.tap()
        //        app.buttons.matching(NSPredicate(format: "label = '+' or label CONTAINS 'Ed'")).firstMatch.tap()
        //        app.tables.cells.containing(NSPredicate(format: "label CONTAINS 'Cicso'")).firstMatch.tap()
        app.tables.cells.containing(.staticText, identifier: "Phone to Jobs").firstMatch.tap()
    }
    
}
