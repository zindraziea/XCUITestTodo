//
//  TodoListScreen.swift
//  TodoUITests
//
//  Created by JIRATH EAKTHITIWORRANUN on 5/7/2564 BE.
//  Copyright © 2564 BE YiGu. All rights reserved.
//

import XCTest

class TodoListScreen: CommonFunction {
    
    private lazy var app = XCUIApplication()
    private lazy var btnAdd = app.navigationBars.buttons["+"]
    private lazy var btnEdit = app.navigationBars.buttons["Edit"]
    private lazy var btnDone = app.navigationBars.buttons["Done"]
    
    func iClickAddNewTodo() {
        XCTContext.runActivity(named: "click button add new todo") { _ in
            btnAdd.tap()
        }
    }
    
    func iVerifyLastTodoList(type: String, title: String, expectedDate: String) {
        XCTContext.runActivity(named: "veirfy last todo list") { _ in
            let intRowCount: Int = app.tables.cells.count
            let targetCell: XCUIElement = app.tables.cells.element(boundBy: intRowCount - 1)
            let txtType: String = type.replacingOccurrences(of: " ", with: "-")
            XCTAssert(targetCell.images["\(txtType)-selected"].exists)
            XCTAssertEqual(targetCell.staticTexts["titleLabel"].label, title)
            XCTAssertEqual(targetCell.staticTexts["dateLabel"].label, expectedDate)
            targetCell.tap()
        }
    }
    
    func iClickEdit() {
        XCTContext.runActivity(named: "click edit button") { _ in
            btnEdit.tap()
        }
    }
    
    func iDeleteTodoListByType(type: TodoType) {
        XCTContext.runActivity(named: "delete todo list by type: \(type.rawValue)") { _ in
            let targetType = type.rawValue.replacingOccurrences(of: " ", with: "-")
            let typeCount: Int = app.cells.containing(NSPredicate(format: "identifier CONTAINS '\(targetType)'")).count
            if typeCount > 0 {
                for _ in 1...typeCount {
                    let targetCell: XCUIElement = app.cells.containing(NSPredicate(format: "identifier CONTAINS '\(targetType)'")).firstMatch
                    targetCell.buttons.matching(NSPredicate(format: "label CONTAINS 'Delete'")).firstMatch.tap()
                    targetCell.buttons["Delete"].tap()
                }
            }
        }
    }
    
    func iClickDone() {
        XCTContext.runActivity(named: "click done button") { _ in
            btnDone.tap()
        }
    }
    
}
