//
//  TodoListScreen.swift
//  TodoUITests
//
//  Created by JIRATH EAKTHITIWORRANUN on 28/9/2563 BE.
//  Copyright © 2563 YiGu. All rights reserved.
//

import XCTest

class TodoListScreen: CommonFunction {
    
    private lazy var app = XCUIApplication()
    private lazy var btnEdit: XCUIElement = app.buttons["Edit"]
    private lazy var btnDone: XCUIElement = app.buttons["Done"]
    private lazy var btnAddNewTodo: XCUIElement = app.buttons["+"]
    
    func iClickAddNewTodo() {
        XCTContext.runActivity(named: "Click add new to do button") { _ in
            btnAddNewTodo.tap()
        }
    }
    
    func iVerifyLastTodoList(todoModel: TodoModel) {
        XCTContext.runActivity(named: "Verify Last to-do detail") { _ in
            let cellCount: Int = app.tables.cells.count
            let targetCell: XCUIElement = app.tables.cells.element(boundBy: cellCount-1)
            XCTAssert(targetCell.images.matching(NSPredicate(format: "identifier CONTAINS '\(todoModel.todoType.rawValue)'")).firstMatch.exists)
            XCTAssertEqual(targetCell.staticTexts.element(boundBy: 0).label, todoModel.inputText)
            XCTAssertEqual(targetCell.staticTexts.element(boundBy: 1).label, todoModel.expectedDate)
            targetCell.tap()
        }
    }
    
    func iClickEdit() {
        XCTContext.runActivity(named: "Click edit button") { _ in
            btnEdit.tap()
        }
    }
    
    func iDeleteTodoByType(todoType: ToDoType) {
        let QueryByType: XCUIElementQuery = app.tables.cells.containing(NSPredicate(format: "identifier CONTAINS '\(todoType.rawValue)'"))
        for _ in 1...QueryByType.count {
            let targetCell: XCUIElement = QueryByType.firstMatch
            targetCell.buttons.containing(NSPredicate(format: "label CONTAINS 'Delete'")).firstMatch.tap()
            targetCell.buttons["Delete"].tap()
        }
    }
    
    func iClickDone() {
        XCTContext.runActivity(named: "Click done button") { _ in
            btnDone.tap()
        }
    }
    
}
