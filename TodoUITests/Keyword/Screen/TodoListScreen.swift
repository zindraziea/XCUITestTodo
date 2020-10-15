//
//  TodoListScreen.swift
//  TodoUITests
//
//  Created by JIRATH EAKTHITIWORRANUN on 9/10/2563 BE.
//  Copyright © 2563 YiGu. All rights reserved.
//

import XCTest

class TodoListScreen: CommonFunction {
    
    private lazy var app = XCUIApplication()
    private lazy var btnAddNewTodo: XCUIElement = app.buttons["+"]
    private lazy var btnEdit: XCUIElement = app.buttons["Edit"]
    private lazy var btnDone: XCUIElement = app.buttons["Done"]
    
    func iClickButtonAddNewTodo() {
        XCTContext.runActivity(named: "Click button add new todo") { _ in
            btnAddNewTodo.tap()
        }
    }
    
    func iVerifyTargetCell(todoTitle: String, todoType: TodoType, expectedDate: String) {
        XCTContext.runActivity(named: "Verify targetCell") { _ in
            let targetCell: XCUIElement = app.tables.cells.containing(.staticText, identifier: todoTitle).firstMatch
            let todoTypeSelected = todoType.rawValue.replacingOccurrences(of: " ", with: "-")
            XCTAssert(targetCell.images["\(todoTypeSelected)-selected"].exists)
            XCTAssertEqual(targetCell.staticTexts["titleLabel"].label, todoTitle)
            XCTAssertEqual(targetCell.staticTexts["dateLabel"].label, expectedDate)
            targetCell.tap()
        }
    }
    
    func iDeleteTodoByType(todoType: TodoType) {
        XCTContext.runActivity(named: "Delete todo by type: \(todoType.rawValue)") { _ in
            btnEdit.tap()
            let todoTypeSelected = todoType.rawValue.replacingOccurrences(of: " ", with: "-")
            let queryCellByType: XCUIElementQuery = app.tables.cells.containing(.image, identifier: "\(todoTypeSelected)-selected")
            if queryCellByType.count > 0 {
                for _ in 1...queryCellByType.count {
                    queryCellByType.element(boundBy: 0).buttons.matching(NSPredicate(format: "label CONTAINS 'Delete'")).firstMatch.tap()
                    queryCellByType.element(boundBy: 0).buttons["trailing0"].tap()
                }
            }
            btnDone.tap()
        }
    }
    
}
