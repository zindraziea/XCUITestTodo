//
//  TodoDetailScreen.swift
//  TodoUITests
//
//  Created by JIRATH EAKTHITIWORRANUN on 5/7/2564 BE.
//  Copyright © 2564 BE YiGu. All rights reserved.
//

import XCTest

class TodoDetailScreen: CommonFunction {
    
    private lazy var app = XCUIApplication()
    private lazy var tfTitle = app.textFields["tfTodoTitle3"]
    private lazy var pkrMonth = app.datePickers.pickerWheels.element(boundBy: 0)
    private lazy var pkrDate = app.datePickers.pickerWheels.element(boundBy: 1)
    private lazy var pkrYear = app.datePickers.pickerWheels.element(boundBy: 2)
    private lazy var stTitle = app.staticTexts["Todo Title:"]
    private lazy var btnDone = app.buttons["Done"]
    
    func iClickBtnbyType(type: String) {
        XCTContext.runActivity(named: "click button: \(type)") { _ in
            app.buttons[type].tap()
        }
    }
    
    func iInputTitle(title: String) {
        XCTContext.runActivity(named: "input title: \(title)") { _ in
//            tfTitle.tap()
//            tfTitle.typeText(title)
            tfTitle.clearAndEnterText(title)
        }
    }
    
    func iSelectMonth(month: String) {
        XCTContext.runActivity(named: "select month: \(month)") { _ in
            pkrMonth.adjust(toPickerWheelValue: month)
        }
    }
    
    func iSelectDate(date: String) {
        XCTContext.runActivity(named: "select date: \(date)") { _ in
            pkrDate.adjust(toPickerWheelValue: date)
        }
    }
    
    func iSelectYear(year: String) {
        XCTContext.runActivity(named: "select year: \(year)") { _ in
            pkrYear.adjust(toPickerWheelValue: year)
        }
    }
    
    func iClickDone() {
        XCTContext.runActivity(named: "click button done") { _ in
            stTitle.tap()
            btnDone.tap()
        }
    }
    
    func iVerifyType(type: String) {
        XCTContext.runActivity(named: "verify type \(type) is selected") { _ in
            XCTAssert(app.buttons[type].isSelected)
        }
    }
    
    func iVerifyTitle(title: String) {
        XCTContext.runActivity(named: "verify titile is: \(title)") { _ in
            
            XCTAssertEqual(unwrapped(tfTitle.value as? String, with: ""), title)
        }
    }
    
    func iVerifyMonth(month: String) {
        XCTContext.runActivity(named: "verify month is: \(month)") { _ in
            XCTAssertEqual(unwrapped(pkrMonth.value as? String, with: ""), month)
        }
    }
    
    func iVerifyDate(date: String) {
        XCTContext.runActivity(named: "verify date is: \(date)") { _ in
            XCTAssertEqual(unwrapped(pkrDate.value as? String, with: ""), date)
        }
    }
    
    func iVerifyYear(year: String) {
        XCTContext.runActivity(named: "verify year is: \(year)") { _ in
            XCTAssertEqual(unwrapped(pkrYear.value as? String, with: ""), year)
        }
    }
}
