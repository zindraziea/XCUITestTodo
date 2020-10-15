//
//  TodoDetailScreen.swift
//  TodoUITests
//
//  Created by JIRATH EAKTHITIWORRANUN on 9/10/2563 BE.
//  Copyright © 2563 YiGu. All rights reserved.
//

import XCTest

class TodoDetailScreen: CommonFunction {

    private lazy var app = XCUIApplication()
    private lazy var txtTodoLable: XCUIElement = app.textFields["todoLabel4"]
    private lazy var txtTodoTitle: XCUIElement = app.staticTexts["Todo Title:"]
    private lazy var pkrMonth: XCUIElement = app.datePickers.pickerWheels.element(boundBy: 0)
    private lazy var pkrDate: XCUIElement = app.datePickers.pickerWheels.element(boundBy: 1)
    private lazy var pkrYear: XCUIElement = app.datePickers.pickerWheels.element(boundBy: 2)
    private lazy var btnDone: XCUIElement = app.buttons["Done"]
    
    func iSelectTodoType(todoType: TodoType) {
        XCTContext.runActivity(named: "Select todo type: \(todoType.rawValue)") { _ in
            app.buttons[todoType.rawValue].tap()
        }
    }
    
    func iInputTitile(todoTitle: String) {
        XCTContext.runActivity(named: "Input todo title") { _ in
            txtTodoLable.clearAndEnterText(todoTitle)
        }
    }
    
    func iSelectDateMonthYear(month: MonthOfYear, date: String, year: String) {
        XCTContext.runActivity(named: "Select month: \(month) date: \(date) year: \(year)") { _ in
            pkrMonth.adjust(toPickerWheelValue: month.rawValue)
            pkrDate.adjust(toPickerWheelValue: date)
            pkrYear.adjust(toPickerWheelValue: year)
        }
    }
    
    func iClickDone() {
        XCTContext.runActivity(named: "Click done button") { _ in
            txtTodoTitle.tap()
            btnDone.tap()
        }
    }
    
    func iVerifyTodoType(todoType: TodoType) {
        XCTContext.runActivity(named: "Verify todo type: \(todoType.rawValue)") { _ in
            XCTAssert(app.buttons[todoType.rawValue].isSelected)
        }
    }
    
    func iVerifyTodoTitle(todoTitle: String) {
        XCTContext.runActivity(named: "Verify todo title: \(todoTitle)") { _ in
            XCTAssertEqual(txtTodoLable.value as! String, todoTitle)
        }
    }
    
    func iVerifyDateMonthYear(month: MonthOfYear, date: String, year: String) {
        XCTContext.runActivity(named: "Select month: \(month.rawValue) date: \(date) year: \(year)") { _ in
            XCTAssertEqual(pkrMonth.value as! String, month.rawValue)
            XCTAssertEqual(pkrDate.value as! String, date)
            XCTAssertEqual(pkrYear.value as! String, year)
        }
    }
    
}
