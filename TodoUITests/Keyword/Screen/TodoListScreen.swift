//
//  TodoListScreen.swift
//  TodoUITests
//
//  Created by JIRATH EAKTHITIWORRANUN on 24/11/2563 BE.
//  Copyright © 2563 YiGu. All rights reserved.
//

import XCTest

class TodoListScreen: CommonFunction {
    private lazy var app = XCUIApplication()
    private lazy var btnAddNewTodo: XCUIElement = app.buttons["+"]
    private lazy var btnEdit: XCUIElement = app.buttons["Edit"]
    
    func iClickButtonAddNewTodo() {
        XCTContext.runActivity(named: "Click button add new to do") { _ in
            btnAddNewTodo.tap()
        }
    }
    
    func iVerifyLastTodoList(todoModel: TodoModel) {
        XCTContext.runActivity(named: "Verify last todo list") { _ in
            let cellCount: Int = app.tables.cells.count
            let targetCell: XCUIElement = app.tables.cells.element(boundBy: cellCount-1)
            let targetType: String = todoModel.type.rawValue.replacingOccurrences(of: " ", with: "-")
            XCTAssert(targetCell.images["\(targetType)-selected"].exists)
            XCTAssertEqual(targetCell.staticTexts["titleLabel"].label, todoModel.title)
            XCTAssertEqual(targetCell.staticTexts["dateLabel"].label, todoModel.expectedDate)
            targetCell.tap()
        }
    }
    
    func iVerifyTargetCell(todoModel: TodoModel) {
        XCTContext.runActivity(named: "Verify target cell: \(todoModel.title)") { _ in
            let targetCell: XCUIElement = app.tables.cells.containing(.staticText, identifier: todoModel.title).firstMatch
            let targetType: String = todoModel.type.rawValue.replacingOccurrences(of: " ", with: "-")
            XCTAssert(targetCell.images["\(targetType)-selected"].exists)
            XCTAssertEqual(targetCell.staticTexts["titleLabel"].label, todoModel.title)
            XCTAssertEqual(targetCell.staticTexts["dateLabel"].label, todoModel.expectedDate)
            targetCell.tap()
        }
    }
    
    func iClickEdit() {
        XCTContext.runActivity(named: "Click button edit") { _ in
            btnEdit.tap()
        }
    }
    
    func iDeleteTodoByType(type: TodoType) {
        XCTContext.runActivity(named: "Delete to do by type") { _ in
            let targetType: String = type.rawValue.replacingOccurrences(of: " ", with: "-")
            let queryCell: XCUIElementQuery = app.tables.cells.containing(NSPredicate(format: "identifier CONTAINS '\(targetType)'"))
            let cellCount: Int = queryCell.count
            if cellCount > 0 {
                for _ in 1...cellCount {
                    queryCell.firstMatch.buttons.matching(NSPredicate(format: "label CONTAINS 'Delete'")).firstMatch.tap()
                    queryCell.firstMatch.buttons["Delete"].tap()
                }
            }
        }
    }
    
}
