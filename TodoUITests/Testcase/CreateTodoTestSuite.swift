//
//  CreateTodoTestSuite.swift
//  TodoUITests
//
//  Created by JIRATH EAKTHITIWORRANUN on 23/11/2563 BE.
//  Copyright © 2563 YiGu. All rights reserved.
//

import XCTest

class CreateTodoTestSuite: XCTestCase {
    private lazy var app = XCUIApplication()
    private lazy var addEditTodoFeature = AddEditTodoFeature()
    
    override func setUp() {
        continueAfterFailure = false
        app.launch()
    }
    
    override func tearDown() {
        print(app.debugDescription)
    }
    
    func test_TODO_101_1() {
        XCTContext.runActivity(named: "Create new Todo-List: Child") { _ in
            let type: TodoType = TodoType.child
            let title: String = "test_TODO_101 Child"
            let month: MonthOfYear = MonthOfYear.October
            let date: String = "11"
            let year: String = "2021"
            let expectedDate: String = "2021-10-11"
            let todoModel = TodoModel(type: type, title: title, month: month, date: date, year: year, expectedDate: expectedDate)
            
            addEditTodoFeature.iGotoNewTodoScreen()
            addEditTodoFeature.iInputNewTodo(todoModel: todoModel)
            addEditTodoFeature.iVerifyLastTodoList(todoModel: todoModel)
            addEditTodoFeature.iVerifyTodoDetail(todoModel: todoModel)
        }
    }
    
    func test_TODO_101_2() {
        XCTContext.runActivity(named: "Create new Todo-List: phone") { _ in
            let type: TodoType = TodoType.phone
            let title: String = "test_TODO_101 Phone"
            let month: MonthOfYear = MonthOfYear.January
            let date: String = "11"
            let year: String = "2021"
            let expectedDate: String = "2021-01-11"
            let todoModel = TodoModel(type: type, title: title, month: month, date: date, year: year, expectedDate: expectedDate)
            
            addEditTodoFeature.iGotoNewTodoScreen()
            addEditTodoFeature.iInputNewTodo(todoModel: todoModel)
            addEditTodoFeature.iVerifyLastTodoList(todoModel: todoModel)
        }
    }
    
    func test_TODO_101_3() {
        XCTContext.runActivity(named: "Create new Todo-List: shopping cart") { _ in
            let type: TodoType = TodoType.shopping_cart
            let title: String = "test_TODO_101 Shopping Cart"
            let month: MonthOfYear = MonthOfYear.January
            let date: String = "11"
            let year: String = "2021"
            let expectedDate: String = "2021-01-11"
            let todoModel = TodoModel(type: type, title: title, month: month, date: date, year: year, expectedDate: expectedDate)
            
            addEditTodoFeature.iGotoNewTodoScreen()
            addEditTodoFeature.iInputNewTodo(todoModel: todoModel)
            addEditTodoFeature.iVerifyTargetCell(todoModel: todoModel)
        }
    }
    
    func test_TODO_101_4() {
        XCTContext.runActivity(named: "Create new Todo-List: travel") { _ in
            let type: TodoType = TodoType.travel
            let title: String = "test_TODO_101 travel"
            let month: MonthOfYear = MonthOfYear.October
            let date: String = "11"
            let year: String = "2021"
            let expectedDate: String = "2021-10-11"
            let todoModel = TodoModel(type: type, title: title, month: month, date: date, year: year, expectedDate: expectedDate)
            
            addEditTodoFeature.iGotoNewTodoScreen()
            addEditTodoFeature.iInputNewTodo(todoModel: todoModel)
            addEditTodoFeature.iVerifyTargetCell(todoModel: todoModel)
        }
    }

}
