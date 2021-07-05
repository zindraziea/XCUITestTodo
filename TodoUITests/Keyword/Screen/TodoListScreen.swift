//
//  TodoListScreen.swift
//  TodoUITests
//
//  Created by JIRATH EAKTHITIWORRANUN on 5/7/2564 BE.
//  Copyright © 2564 BE YiGu. All rights reserved.
//

import XCTest

class TodoListScreen: XCTestCase {

    private lazy var app = XCUIApplication()
    private lazy var btnAdd = app.navigationBars.buttons["+"]
    
    func iClickAddNewTodo() {
        XCTContext.runActivity(named: "click button add new todo") { _ in
            btnAdd.tap()
        }
    }
    
    func iVerifyLastTodoList(type: String, title: String, expectedDate: String) {
        let intRowCount: Int = app.tables.cells.count
        let targetCell: XCUIElement = app.tables.cells.element(boundBy: intRowCount - 1)
        XCTAssert(targetCell.images["\(type)-selected"].exists)
        XCTAssertEqual(targetCell.staticTexts["titleLabel"].label, title)
        XCTAssertEqual(targetCell.staticTexts["dateLabel"].label, expectedDate)
        targetCell.tap()
    }
    
    
}
