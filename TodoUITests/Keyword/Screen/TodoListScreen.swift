//
//  TodoListScreen.swift
//  TodoUITests
//
//  Created by JIRATH EAKTHITIWORRANUN on 23/2/2564 BE.
//  Copyright © 2564 BE YiGu. All rights reserved.
//

import XCTest

class TodoListScreen: CommonUtils {
    
    private lazy var app = XCUIApplication()
    private lazy var btnNewTodo: XCUIElement = app.buttons["+"]
    private lazy var btnEdit: XCUIElement = app.buttons["Edit"]
    
    func iClickAddNewTodo() {
        btnNewTodo.tap()
    }
    
    func iVerifyLastTodoList(todoType: String, title: String, expectedDate: String) {
        let cellCount: Int = app.tables.cells.count
        let targetCell: XCUIElement = app.tables.cells.element(boundBy: cellCount-1)
        iVerifyTargetCell(targetCell: targetCell,todoType: todoType, title: title, expectedDate: expectedDate)
    }
    
    func iVerifyTargetTodoList(todoType: String, title: String, expectedDate: String) {
        let targetCell: XCUIElement = app.tables.cells.containing(NSPredicate(format: "label = '\(title)'")).firstMatch
        iVerifyTargetCell(targetCell: targetCell,todoType: todoType, title: title, expectedDate: expectedDate)
    }
    
    private func iVerifyTargetCell(targetCell: XCUIElement, todoType: String, title: String, expectedDate: String) {
        XCTAssert(targetCell.images["\(todoType.replacingOccurrences(of: " ", with: "-"))-selected"].exists)
        XCTAssertEqual(targetCell.staticTexts["titleLabel"].label, title)
        XCTAssertEqual(targetCell.staticTexts["dateLabel"].label, expectedDate)
        targetCell.tap()
    }
    
    func iClickEdit() {
        btnEdit.tap()
    }
    
    func iRemoveTodoType(todoType: TodoType) {
        let cellCount: Int = app.tables.cells.containing(.image, identifier: "\(todoType.rawValue.replacingOccurrences(of: " ", with: "-"))-selected").count
        if cellCount > 0 {
            for _ in 1...cellCount {
                let targetCell: XCUIElement = app.tables.cells.containing(.image, identifier: "\(todoType.rawValue.replacingOccurrences(of: " ", with: "-"))-selected").firstMatch
                targetCell.buttons.matching(NSPredicate(format: "label CONTAINS 'Delete'")).firstMatch.tap()
                targetCell.buttons["Delete"].tap()
            }
        }
    }
    
}
