//
//  TodoDetailScreen.swift
//  TodoUITests
//
//  Created by JIRATH EAKTHITIWORRANUN on 28/9/2563 BE.
//  Copyright © 2563 YiGu. All rights reserved.
//

import XCTest

class TodoDetailScreen: CommonFunction {
    
    private lazy var app = XCUIApplication()
    private lazy var btnChild: XCUIElement = app.buttons["child"]
    private lazy var btnPhone: XCUIElement = app.buttons["phone"]
    private lazy var btnShoppingCart: XCUIElement = app.buttons["shopping cart"]
    private lazy var btnTravel: XCUIElement = app.buttons["travel"]
    private lazy var txtTodoTitleLabel: XCUIElement = app.textFields["todoTitleLabel2"]
    private lazy var txtTodoTitle: XCUIElement = app.staticTexts["Todo Title:"]
    private lazy var pkrMonth: XCUIElement = app.datePickers.pickerWheels.element(boundBy: 0)
    private lazy var pkrDate: XCUIElement = app.datePickers.pickerWheels.element(boundBy: 1)
    private lazy var pkrYear: XCUIElement = app.datePickers.pickerWheels.element(boundBy: 2)
    private lazy var btnDone: XCUIElement = app.buttons["Done"]
    
    func iClickChildButton() {
        XCTContext.runActivity(named: "Click child button") { _ in
            btnChild.tap()
        }
    }
    
    func iClickPhoneButton() {
        XCTContext.runActivity(named: "Click phone button") { _ in
            btnPhone.tap()
        }
    }
    
    func iClickShoppingCartButton() {
        XCTContext.runActivity(named: "Click shopping cart button") { _ in
            btnShoppingCart.tap()
        }
    }
    
    
    func iClickTravelButton() {
        XCTContext.runActivity(named: "Click travel button") { _ in
            btnTravel.tap()
        }
    }
    
    func iClickTodoType(todoType: ToDoType) {
        XCTContext.runActivity(named: "Click todo type \(todoType.rawValue) button") { _ in
            let txtTodoType = todoType.rawValue.replacingOccurrences(of: "-", with: " ")
            app.buttons[txtTodoType].tap()
        }
    }
    
    func iInputTodoTitleLabel(inputText: String) {
        XCTContext.runActivity(named: "Input to-do title: \(inputText)") { _ in
//            txtTodoTitleLabel.tap()
//            txtTodoTitleLabel.typeText(inputText)
            if waitForElementHitable(txtTodoTitleLabel) {
                txtTodoTitleLabel.clearAndEnterText(inputText)
            }
        }
    }
    
    func iInputMonthDateYear(month: MonthOfYear, date: String, year: String){
        XCTContext.runActivity(named: "Adjust Month: \(month.rawValue) Date: \(date) Year: \(year)") { _ in
            pkrMonth.adjust(toPickerWheelValue: month.rawValue)
            pkrDate.adjust(toPickerWheelValue: date)
            pkrYear.adjust(toPickerWheelValue: year)
        }
    }
    
    func iClickDone(){
        XCTContext.runActivity(named: "Click Done Button") { _ in
            txtTodoTitle.tap()
            btnDone.tap()
        }
    }
    
    func iVerifyTodoType(todoType: ToDoType) {
        XCTContext.runActivity(named: "Verify to-do type: \(todoType.rawValue)") { _ in
            let txtTodoType = todoType.rawValue.replacingOccurrences(of: "-", with: " ")
            XCTAssert(app.buttons[txtTodoType].isSelected)
        }
    }
    
    func iVerifyTodoTitleLabel(inputText: String) {
        XCTContext.runActivity(named: "Verify to-do title: \(inputText)") { _ in
            XCTAssertEqual(txtTodoTitleLabel.value as! String, inputText)
        }
    }
    
    func iVerifyMonthDateYear(month: MonthOfYear, date: String, year: String) {
        XCTContext.runActivity(named: "Verify month: \(month.rawValue), date: \(date), year: \(year)") { _ in
            XCTAssertEqual(pkrMonth.value as! String, month.rawValue)
            XCTAssertEqual(pkrDate.value as! String, date)
            XCTAssertEqual(pkrYear.value as! String, year)
        }
    }
    
}
