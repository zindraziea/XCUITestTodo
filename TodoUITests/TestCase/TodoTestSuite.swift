//
//  TodoTestSuite.swift
//  TodoUITests
//
//  Created by JIRATH EAKTHITIWORRANUN on 8/10/2563 BE.
//  Copyright © 2563 YiGu. All rights reserved.
//

import XCTest

class TodoTestSuite: CommonFunction {
    
    private lazy var app = XCUIApplication()
    private lazy var addEditTodo = AddEditTodo()
    private lazy var deleteTodo = DeleteTodo()
    
    private lazy var todoType: TodoType = TodoType.phone
    private lazy var todoTitle: String = "Test 101"
    private lazy var month: MonthOfYear = MonthOfYear.July
    private lazy var date: String = "12"
    private lazy var year: String = "2022"
    private lazy var expectedDate: String = "2022-07-12"
    private lazy var todoModel = TodoModel(todoType: todoType, todoTitle: todoTitle, month: month, date: date, year: year, expectedDate: expectedDate)

    override func setUp() {
        continueAfterFailure = false
        app.launch()
    }

    override func tearDown() {
    }

    func test_TODO_101_1() {
        XCTContext.runActivity(named: "Create new Todo-List : phone") { _ in
            addEditTodo.iGotoNewTodoScreen()
            addEditTodo.iInputTodoDetail(todoModel: todoModel)
            addEditTodo.iVerifyTodoListScreen(todoModel: todoModel)
            addEditTodo.iVerifyTodoDetailScreen(todoModel: todoModel)
        }
    }
    
    func test_TODO_102() {
        XCTContext.runActivity(named: "Edit description on new Todo-List") { _ in
            let todoType2: TodoType = TodoType.travel
            let todoTitle2: String = "Test 102"
            let month2: MonthOfYear = MonthOfYear.December
            let date2: String = "12"
            let year2: String = "2022"
            let expectedDate2: String = "2022-12-12"
            let todoModel2 = TodoModel(todoType: todoType2, todoTitle: todoTitle2, month: month2, date: date2, year: year2, expectedDate: expectedDate2)
            
            addEditTodo.iGotoNewTodoScreen()
            addEditTodo.iInputTodoDetail(todoModel: todoModel)
            addEditTodo.iVerifyTodoListScreen(todoModel: todoModel)
            addEditTodo.iVerifyTodoDetailScreen(todoModel: todoModel)
            addEditTodo.iGotoNewTodoScreen()
            addEditTodo.iInputTodoDetail(todoModel: todoModel2)
            addEditTodo.iVerifyTodoListScreen(todoModel: todoModel2)
            addEditTodo.iVerifyTodoDetailScreen(todoModel: todoModel2)
        }
    }
    
    func test_TODO_103() {
        XCTContext.runActivity(named: "Add new 10 Todo-List") { _ in
            for index in 1...10 {
                todoTitle = "Test 103-\(index)"
                let todoModel = TodoModel(todoType: todoType, todoTitle: todoTitle, month: month, date: date, year: year, expectedDate: expectedDate)
                addEditTodo.iGotoNewTodoScreen()
                addEditTodo.iInputTodoDetail(todoModel: todoModel)
                addEditTodo.iVerifyTodoListScreen(todoModel: todoModel)
                addEditTodo.iVerifyTodoDetailScreen(todoModel: todoModel)
            }
        }
    }
    
    func test_TODO_104() {
        XCTContext.runActivity(named: "Crete new shopping-cart and phone Todo-List, Delete all shopping-cart type") { _ in
            let todoType: TodoType = TodoType.shoppingCart
            let todoTitle: String = "Test 104-1"
            let month: MonthOfYear = MonthOfYear.December
            let date: String = "12"
            let year: String = "2022"
            let expectedDate: String = "2022-12-12"
            let todoModel = TodoModel(todoType: todoType, todoTitle: todoTitle, month: month, date: date, year: year, expectedDate: expectedDate)
            let todoType2: TodoType = TodoType.phone
            let todoTitle2: String = "Test 104-2"
            let month2: MonthOfYear = MonthOfYear.January
            let date2: String = "12"
            let year2: String = "2022"
            let expectedDate2: String = "2022-01-12"
            let todoModel2 = TodoModel(todoType: todoType2, todoTitle: todoTitle2, month: month2, date: date2, year: year2, expectedDate: expectedDate2)
            
            addEditTodo.iGotoNewTodoScreen()
            addEditTodo.iInputTodoDetail(todoModel: todoModel)
            addEditTodo.iVerifyTodoListScreen(todoModel: todoModel)
            addEditTodo.iVerifyTodoDetailScreen(todoModel: todoModel)
            addEditTodo.iGotoNewTodoScreen()
            addEditTodo.iInputTodoDetail(todoModel: todoModel2)
            addEditTodo.iVerifyTodoListScreen(todoModel: todoModel2)
            addEditTodo.iVerifyTodoDetailScreen(todoModel: todoModel2)
            deleteTodo.iDeleteTodoByType(todoType: TodoType.shoppingCart)
        }
    }

}
