//
//  CreateTodoTestSuite.swift
//  TodoUITests
//
//  Created by Thannaphat Atinonthanakorn on 27/1/2564 BE.
//  Copyright © 2564 BE YiGu. All rights reserved.
//

import XCTest

class CreateTodoTestSuite: XCTestCase {

    private lazy var app = XCUIApplication()
    private lazy var btnNewTodo: XCUIElement = app.buttons["+"]
    private lazy var txtTitle: XCUIElement = app.staticTexts["Todo Title:"]
    private lazy var tfTodoTitle: XCUIElement = app.textFields["tfTodoTitle3"]
    private lazy var pkMonth: XCUIElement = app.datePickers.pickerWheels.element(boundBy: 0)
    private lazy var pkDate: XCUIElement = app.datePickers.pickerWheels.element(boundBy: 1)
    private lazy var pkYear: XCUIElement = app.datePickers.pickerWheels.element(boundBy: 2)
    private lazy var btnDone: XCUIElement = app.buttons["Done"]
    
    override func setUpWithError() throws {
        continueAfterFailure = false
        app.launch()
    }

    override func tearDownWithError() throws {
    }
    
    func test101_1() {
        XCTContext.runActivity(named: "Create new Todo-List: child") { _ in
            let title: String = "test 101"
            let month: String = "February"
            let date: String = "11"
            let year: String = "2023"
            let expectedDate: String = "2023-02-11"
            let todoType: String = "child"
            
            btnNewTodo.tap()
            app.buttons[todoType].tap()
            tfTodoTitle.tap()
            tfTodoTitle.typeText(title)
            pkMonth.adjust(toPickerWheelValue: month)
            pkDate.adjust(toPickerWheelValue: date)
            pkYear.adjust(toPickerWheelValue: year)
            txtTitle.tap()
            btnDone.tap()
            let cellCount: Int = app.tables.cells.count
            let targetCell: XCUIElement = app.tables.cells.element(boundBy: cellCount-1)
            XCTAssert(targetCell.images["\(todoType.replacingOccurrences(of: " ", with: "-"))-selected"].exists)
            XCTAssertEqual(targetCell.staticTexts["titleLabel"].label, title)
            XCTAssertEqual(targetCell.staticTexts["dateLabel"].label, expectedDate)
            targetCell.tap()
            XCTAssert(app.buttons[todoType].isSelected)
            XCTAssertEqual(tfTodoTitle.value as? String, title)
            XCTAssertEqual(pkMonth.value as? String, month)
            XCTAssertEqual(pkDate.value as? String, date)
            XCTAssertEqual(pkYear.value as? String, year)
        }
    }

    func test101_2() {
        XCTContext.runActivity(named: "Create new Todo-List: phone") { _ in
            let title: String = "test 101"
            let month: String = "February"
            let date: String = "3"
            let year: String = "2022"
            let expectedDate: String = "2022-02-03"
            let todoType: String = "phone"
            
            btnNewTodo.tap()
            app.buttons[todoType].tap()
            tfTodoTitle.tap()
            tfTodoTitle.typeText(title)
            pkMonth.adjust(toPickerWheelValue: month)
            pkDate.adjust(toPickerWheelValue: date)
            pkYear.adjust(toPickerWheelValue: year)
            txtTitle.tap()
            btnDone.tap()
            let cellCount: Int = app.tables.cells.count
            let targetCell: XCUIElement = app.tables.cells.element(boundBy: cellCount-1)
            XCTAssert(targetCell.images["\(todoType.replacingOccurrences(of: " ", with: "-"))-selected"].exists)
            XCTAssertEqual(targetCell.staticTexts["titleLabel"].label, title)
            XCTAssertEqual(targetCell.staticTexts["dateLabel"].label, expectedDate)
            targetCell.tap()
            XCTAssert(app.buttons[todoType].isSelected)
            XCTAssertEqual(tfTodoTitle.value as? String, title)
            XCTAssertEqual(pkMonth.value as? String, month)
            XCTAssertEqual(pkDate.value as? String, date)
            XCTAssertEqual(pkYear.value as? String, year)
        }
    }
    
    func test101_3() {
        XCTContext.runActivity(named: "Create new Todo-List: shopping cart") { _ in
            let title: String = "test 101"
            let month: String = "February"
            let date: String = "11"
            let year: String = "2023"
            let expectedDate: String = "2023-02-11"
            let todoType: String = "shopping cart"
            
            btnNewTodo.tap()
            app.buttons[todoType].tap()
            tfTodoTitle.tap()
            tfTodoTitle.typeText(title)
            pkMonth.adjust(toPickerWheelValue: month)
            pkDate.adjust(toPickerWheelValue: date)
            pkYear.adjust(toPickerWheelValue: year)
            txtTitle.tap()
            btnDone.tap()
            let cellCount: Int = app.tables.cells.count
            let targetCell: XCUIElement = app.tables.cells.element(boundBy: cellCount-1)
            XCTAssert(targetCell.images["\(todoType.replacingOccurrences(of: " ", with: "-"))-selected"].exists)
            XCTAssertEqual(targetCell.staticTexts["titleLabel"].label, title)
            XCTAssertEqual(targetCell.staticTexts["dateLabel"].label, expectedDate)
            targetCell.tap()
            XCTAssert(app.buttons[todoType].isSelected)
            XCTAssertEqual(tfTodoTitle.value as? String, title)
            XCTAssertEqual(pkMonth.value as? String, month)
            XCTAssertEqual(pkDate.value as? String, date)
            XCTAssertEqual(pkYear.value as? String, year)
        }
    }
    
    func test101_4() {
        XCTContext.runActivity(named: "Create new Todo-List: travel") { _ in
            let title: String = "test 101"
            let month: String = "February"
            let date: String = "11"
            let year: String = "2023"
            let expectedDate: String = "2023-02-11"
            let todoType: String = "travel"
            
            btnNewTodo.tap()
            app.buttons[todoType].tap()
            tfTodoTitle.tap()
            tfTodoTitle.typeText(title)
            pkMonth.adjust(toPickerWheelValue: month)
            pkDate.adjust(toPickerWheelValue: date)
            pkYear.adjust(toPickerWheelValue: year)
            txtTitle.tap()
            btnDone.tap()
            let cellCount: Int = app.tables.cells.count
            let targetCell: XCUIElement = app.tables.cells.element(boundBy: cellCount-1)
            XCTAssert(targetCell.images["\(todoType.replacingOccurrences(of: " ", with: "-"))-selected"].exists)
            XCTAssertEqual(targetCell.staticTexts["titleLabel"].label, title)
            XCTAssertEqual(targetCell.staticTexts["dateLabel"].label, expectedDate)
            targetCell.tap()
            XCTAssert(app.buttons[todoType].isSelected)
            XCTAssertEqual(tfTodoTitle.value as? String, title)
            XCTAssertEqual(pkMonth.value as? String, month)
            XCTAssertEqual(pkDate.value as? String, date)
            XCTAssertEqual(pkYear.value as? String, year)
        }
    }

}
