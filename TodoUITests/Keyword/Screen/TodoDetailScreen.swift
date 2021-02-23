//
//  TodoDetailScreen.swift
//  TodoUITests
//
//  Created by JIRATH EAKTHITIWORRANUN on 23/2/2564 BE.
//  Copyright © 2564 BE YiGu. All rights reserved.
//

import XCTest

class TodoDetailScreen: XCTestCase {
    
    private lazy var app = XCUIApplication()
    private lazy var txtTitle: XCUIElement = app.staticTexts["Todo Title:"]
    private lazy var tfTodoTitle: XCUIElement = app.textFields["tfTodoTitle3"]
    private lazy var pkMonth: XCUIElement = app.datePickers.pickerWheels.element(boundBy: 0)
    private lazy var pkDate: XCUIElement = app.datePickers.pickerWheels.element(boundBy: 1)
    private lazy var pkYear: XCUIElement = app.datePickers.pickerWheels.element(boundBy: 2)
    private lazy var btnDone: XCUIElement = app.buttons["Done"]

    func iSelectTodoType(todoType: String) {
        app.buttons[todoType].tap()
    }
    
    func iInputTodoTitle(title: String) {
        tfTodoTitle.tap()
        tfTodoTitle.typeText(title)
    }
    
    func iSelectMonthDateYear(month: String, date: String, year: String) {
        pkMonth.adjust(toPickerWheelValue: month)
        pkDate.adjust(toPickerWheelValue: date)
        pkYear.adjust(toPickerWheelValue: year)
    }
    
    func iClickDone() {
        txtTitle.tap()
        btnDone.tap()
    }
    
    func iVerifyTodoType(todoType: String) {
        XCTAssert(app.buttons[todoType].isSelected)
    }
    
    func iVerifyTodoTitle(title: String) {
        XCTAssertEqual(tfTodoTitle.value as? String, title)
    }
    
    func iVerifyDateMonthYear(month: String, date: String, year: String) {
        XCTAssertEqual(pkMonth.value as? String, month)
        XCTAssertEqual(pkDate.value as? String, date)
        XCTAssertEqual(pkYear.value as? String, year)
    }
}
