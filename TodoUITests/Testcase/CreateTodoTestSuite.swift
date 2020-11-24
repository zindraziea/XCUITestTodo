//
//  CreateTodoTestSuite.swift
//  TodoUITests
//
//  Created by JIRATH EAKTHITIWORRANUN on 23/11/2563 BE.
//  Copyright © 2563 YiGu. All rights reserved.
//

import XCTest

class CreateTodoTestSuite: CommonFunction {
    private lazy var app = XCUIApplication()
    private lazy var addEditTodoFeature = AddEditTodoFeature()
    private lazy var deleteTodoFeature = DeleteTodoFeature()
    
    private lazy var type: TodoType = TodoType.child
    private lazy var title: String = "test_TODO_101 Child"
    private lazy var month: MonthOfYear = MonthOfYear.October
    private lazy var date: String = "11"
    private lazy var year: String = "2021"
    private lazy var expectedDate: String = "2021-10-11"
    private lazy var todoModel = TodoModel(type: type, title: title, month: month, date: date, year: year, expectedDate: expectedDate)
    
    override func setUp() {
        continueAfterFailure = false
        app.launch()
    }
    
    override func tearDown() {
        print(app.debugDescription)
    }
    
    func test_TODO_101() {
        XCTContext.runActivity(named: "Create new Todo-List: Child") { _ in

            addEditTodoFeature.iGotoNewTodoScreen()
            addEditTodoFeature.iInputNewTodo(todoModel: todoModel)
            addEditTodoFeature.iVerifyLastTodoList(todoModel: todoModel)
            addEditTodoFeature.iVerifyTodoDetail(todoModel: todoModel)
        }
    }
    
    func test_TODO_102() {
        XCTContext.runActivity(named: "Edit description on new Todo-List") { _ in
            addEditTodoFeature.iGotoNewTodoScreen()
            addEditTodoFeature.iInputNewTodo(todoModel: todoModel)
            addEditTodoFeature.iVerifyLastTodoList(todoModel: todoModel)
            addEditTodoFeature.iVerifyTodoDetail(todoModel: todoModel)
            
            type = TodoType.phone
            title = "test_TODO_102 Phone"
            month = MonthOfYear.December
            date = "12"
            year = "2022"
            expectedDate = "2022-12-12"
            todoModel = TodoModel(type: type, title: title, month: month, date: date, year: year, expectedDate: expectedDate)
            addEditTodoFeature.iInputNewTodo(todoModel: todoModel)
            addEditTodoFeature.iVerifyLastTodoList(todoModel: todoModel)
            addEditTodoFeature.iVerifyTodoDetail(todoModel: todoModel)
        }
    }
    
    func test_TODO_103() {
        XCTContext.runActivity(named: "Add new 10 Todo-List") { _ in
            for index in 1...10 {
                title = "test_TODO_103: \(index)"
                todoModel = TodoModel(type: type, title: title, month: month, date: date, year: year, expectedDate: expectedDate)
                addEditTodoFeature.iGotoNewTodoScreen()
                addEditTodoFeature.iInputNewTodo(todoModel: todoModel)
                addEditTodoFeature.iVerifyLastTodoList(todoModel: todoModel)
                addEditTodoFeature.iVerifyTodoDetail(todoModel: todoModel)
                addEditTodoFeature.iClickDone()
            }
        }
    }
    
    func test_TODO_104() {
        XCTContext.runActivity(named: "Crete new shopping-cart and phone Todo-List, Delete all shopping-cart type") { _ in
            type = TodoType.shopping_cart
            title = "test_TODO_102 shoppin cart"
            month = MonthOfYear.December
            date = "12"
            year = "2022"
            expectedDate = "2022-12-12"
            todoModel = TodoModel(type: type, title: title, month: month, date: date, year: year, expectedDate: expectedDate)
            addEditTodoFeature.iGotoNewTodoScreen()
            addEditTodoFeature.iInputNewTodo(todoModel: todoModel)
            addEditTodoFeature.iVerifyLastTodoList(todoModel: todoModel)
            addEditTodoFeature.iVerifyTodoDetail(todoModel: todoModel)
            addEditTodoFeature.iClickDone()
            
            type = TodoType.phone
            title = "test_TODO_102 Phone"
            month = MonthOfYear.December
            date = "12"
            year = "2022"
            expectedDate = "2022-12-12"
            todoModel = TodoModel(type: type, title: title, month: month, date: date, year: year, expectedDate: expectedDate)
            addEditTodoFeature.iGotoNewTodoScreen()
            addEditTodoFeature.iInputNewTodo(todoModel: todoModel)
            addEditTodoFeature.iVerifyLastTodoList(todoModel: todoModel)
            addEditTodoFeature.iVerifyTodoDetail(todoModel: todoModel)
            addEditTodoFeature.iClickDone()
            deleteTodoFeature.iDeleteTodoByType(type: TodoType.shopping_cart)
        }
    }
}
