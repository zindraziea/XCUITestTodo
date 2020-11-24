//
//  TodoDetailScreen.swift
//  TodoUITests
//
//  Created by JIRATH EAKTHITIWORRANUN on 24/11/2563 BE.
//  Copyright © 2563 YiGu. All rights reserved.
//

import XCTest

class TodoDetailScreen: XCTestCase {
    private lazy var app = XCUIApplication()
    private lazy var txtTodoTitle: XCUIElement = app.staticTexts["Todo Title:"]
    private lazy var txtTodoLabel: XCUIElement = app.textFields["todoTitleLabel3"]
    private lazy var pkMonth: XCUIElement = app.datePickers.pickerWheels.element(boundBy: 0)
    private lazy var pkDate: XCUIElement = app.datePickers.pickerWheels.element(boundBy: 1)
    private lazy var pkYear: XCUIElement = app.datePickers.pickerWheels.element(boundBy: 2)
    private lazy var btnDone: XCUIElement = app.buttons["Done"]
    
    func iSelectTodoType(todoType: TodoType) {
        XCTContext.runActivity(named: "Select to do type: \(todoType.rawValue)") { _ in
            app.buttons[todoType.rawValue].tap()
        }
    }
    
    func iInputTodoTitle(title: String) {
        XCTContext.runActivity(named: "Input to do title: \(title)") { _ in
            txtTodoLabel.tap()
            txtTodoLabel.typeText(title)
        }
    }
    
    func iInputMonth(month: MonthOfYear) {
        XCTContext.runActivity(named: "Select month: \(month.rawValue)") { _ in
            pkMonth.adjust(toPickerWheelValue: month.rawValue)
        }
    }
    
    func iInputDate(date: String) {
        XCTContext.runActivity(named: "Select date: \(date)") { _ in
            pkDate.adjust(toPickerWheelValue: date)
        }
    }
    
    func iInputYear(year: String) {
        XCTContext.runActivity(named: "Select year: \(year)") { _ in
            pkYear.adjust(toPickerWheelValue: year)
        }
    }
    
    func iClickDone() {
        XCTContext.runActivity(named: "Click button done") { _ in
            txtTodoTitle.tap()
            btnDone.tap()
        }
    }
    
    func iVerifyTodoType(todoType: TodoType) {
        XCTContext.runActivity(named: "Verify to do type: \(todoType.rawValue)") { _ in
            XCTAssert(app.buttons[todoType.rawValue].exists)
        }
    }
    
    func iVerifyTodoTitle(title: String) {
        XCTContext.runActivity(named: "Verify to do type: \(title)") { _ in
            XCTAssertEqual(txtTodoLabel.value as! String, title)
        }
    }
    
    func iVerifyMothDateYear(month: MonthOfYear, date: String, year: String) {
        XCTContext.runActivity(named: "Verify month: \(month.rawValue) ,date: \(date), year: \(year)") { _ in
                XCTAssertEqual(pkMonth.value as! String, month.rawValue)
                XCTAssertEqual(pkDate.value as! String, date)
                XCTAssertEqual(pkYear.value as! String, year)
        }
    }
    
}
