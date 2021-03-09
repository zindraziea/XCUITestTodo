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
    private lazy var createEditTodoFeature = CreateEditTodoFeature()
    //Test Data
    private lazy var title: String = "test 101"
    private lazy var month: MonthOfYear = MonthOfYear.February
    private lazy var date: String = "11"
    private lazy var year: String = "2023"
    private lazy var expectedDate: String = "2023-02-11"
    private lazy var todoType: TodoType = TodoType.child
    private lazy var todoModel = TodoModel(title: title, month: month, date: date, year: year, expectedDate: expectedDate, type: todoType)
    
    override func setUpWithError() throws {
        continueAfterFailure = false
        app.launch()
    }

    override func tearDownWithError() throws {
    }
    
    func test101_1() {
        XCTContext.runActivity(named: "Create new Todo-List: child") { _ in
            
            createEditTodoFeature.iGotoNewTodoScreen()
            createEditTodoFeature.iInputNewTodo(todoModel: todoModel)
            createEditTodoFeature.iVerifyTargetTodoList(todoModel: todoModel)
            createEditTodoFeature.iVerifyTodoDetail(todoModel: todoModel)
        }
    }

//    func test101_2() {
//        XCTContext.runActivity(named: "Create new Todo-List: phone") { _ in
//            let title: String = "test 101"
//            let month: String = "February"
//            let date: String = "3"
//            let year: String = "2022"
//            let expectedDate: String = "2022-02-03"
//            let todoType: String = "phone"
//
//            createEditTodoFeature.iGotoNewTodoScreen()
//            createEditTodoFeature.iInputNewTodo(todoType: todoType, title: title, month: month, date: date, year: year)
//            createEditTodoFeature.iVerifyLastTodoList(todoType: todoType, title: title, expectedDate: expectedDate)
//            createEditTodoFeature.iVerifyTodoDetail(todoType: todoType, title: title, month: month, date: date, year: year)
//        }
//    }
//
//    func test101_3() {
//        XCTContext.runActivity(named: "Create new Todo-List: shopping cart") { _ in
//            let title: String = "test 101"
//            let month: String = "February"
//            let date: String = "11"
//            let year: String = "2023"
//            let expectedDate: String = "2023-02-11"
//            let todoType: String = "shopping cart"
//
//            createEditTodoFeature.iGotoNewTodoScreen()
//            createEditTodoFeature.iInputNewTodo(todoType: todoType, title: title, month: month, date: date, year: year)
//            createEditTodoFeature.iVerifyLastTodoList(todoType: todoType, title: title, expectedDate: expectedDate)
//            createEditTodoFeature.iVerifyTodoDetail(todoType: todoType, title: title, month: month, date: date, year: year)
//        }
//    }
//
//    func test101_4() {
//        XCTContext.runActivity(named: "Create new Todo-List: travel") { _ in
//            let title: String = "test 101"
//            let month: String = "February"
//            let date: String = "11"
//            let year: String = "2023"
//            let expectedDate: String = "2023-02-11"
//            let todoType: String = "travel"
//
//            createEditTodoFeature.iGotoNewTodoScreen()
//            createEditTodoFeature.iInputNewTodo(todoType: todoType, title: title, month: month, date: date, year: year)
//            createEditTodoFeature.iVerifyLastTodoList(todoType: todoType, title: title, expectedDate: expectedDate)
//            createEditTodoFeature.iVerifyTodoDetail(todoType: todoType, title: title, month: month, date: date, year: year)
//        }
//    }

}
