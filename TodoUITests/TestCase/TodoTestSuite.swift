//
//  TodoUITests.swift
//  TodoUITests
//
//  Created by JIRATH EAKTHITIWORRANUN on 28/9/2563 BE.
//  Copyright © 2563 YiGu. All rights reserved.
//

import XCTest

class TodoTestSuite: XCTestCase {
    
    private lazy var app = XCUIApplication()
    private lazy var safari = XCUIApplication(bundleIdentifier: "com.apple.mobilesafari")
    private lazy var addEditTodo = AddEditTodo()
    private lazy var deleteTodo = DeleteTodo()
    private lazy var todoType: ToDoType = ToDoType.phone
    private lazy var inputText: String = "test 101"
    private lazy var month: MonthOfYear = MonthOfYear.July
    private lazy var date: String = "30"
    private lazy var year: String = "2019"
    private lazy var expectedDate: String = "2019-07-30"
    private lazy var todoModel = TodoModel(todoType: todoType, inputText: inputText, month: month, date: date, year: year, expectedDate: expectedDate)
    
    override func setUp() {
        continueAfterFailure = false
        app.launch()
    }
    
    override func tearDown() {
        print(app.debugDescription)
    }
    
    func test_TODO_101() {
        XCTContext.runActivity(named: "Create new Todo-List") { _ in
            addEditTodo.iGotoNewTodoScreen()
            addEditTodo.iInputTodoDetail(todoModel: todoModel)
            addEditTodo.iVerifyTodoList(todoModel: todoModel)
            addEditTodo.iVerifyTodoDetail(todoModel: todoModel)
        }
    }
    
    func test_TODO_102() {
        XCTContext.runActivity(named: "Edit description on new Todo-List") { _ in
            let todoType2: ToDoType = ToDoType.travel
            let inputText2: String = "test 102"
            let month2: MonthOfYear = MonthOfYear.December
            let date2: String = "10"
            let year2: String = "2020"
            let expectedDate2: String = "2020-12-10"
            let todoModel2 = TodoModel(todoType: todoType2, inputText: inputText2, month: month2, date: date2, year: year2, expectedDate: expectedDate2)
            
            addEditTodo.iGotoNewTodoScreen()
            addEditTodo.iInputTodoDetail(todoModel: todoModel)
            addEditTodo.iVerifyTodoList(todoModel: todoModel)
            addEditTodo.iVerifyTodoDetail(todoModel: todoModel)
            addEditTodo.iInputTodoDetail(todoModel: todoModel2)
            addEditTodo.iVerifyTodoList(todoModel: todoModel2)
            addEditTodo.iVerifyTodoDetail(todoModel: todoModel2)
        }
    }
    
    func test_TODO_103() {
        XCTContext.runActivity(named: "Add new 10 Todo-List") { _ in
            for index in 1...10 {
                inputText = "test 103: \(index)"
                let todoModel = TodoModel(todoType: todoType, inputText: inputText, month: month, date: date, year: year, expectedDate: expectedDate)
                addEditTodo.iGotoNewTodoScreen()
                addEditTodo.iInputTodoDetail(todoModel: todoModel)
                addEditTodo.iVerifyTodoList(todoModel: todoModel)
                addEditTodo.iVerifyTodoDetail(todoModel: todoModel)
                addEditTodo.iClickDone()
            }
        }
    }
    
    func test_TODO_104() {
        XCTContext.runActivity(named: "Crete new shopping-cart and phone Todo-List,Delete all shopping-cart type") { _ in
            todoType = ToDoType.shoppingCart
            inputText = "Test 104 shopping-cart"
            let todoModel = TodoModel(todoType: todoType, inputText: inputText, month: month, date: date, year: year, expectedDate: expectedDate)
            todoType = ToDoType.phone
            inputText = "Test 104 phone"
            let todoModel2 = TodoModel(todoType: todoType, inputText: inputText, month: month, date: date, year: year, expectedDate: expectedDate)
            
            addEditTodo.iGotoNewTodoScreen()
            addEditTodo.iInputTodoDetail(todoModel: todoModel)
            addEditTodo.iVerifyTodoList(todoModel: todoModel)
            addEditTodo.iVerifyTodoDetail(todoModel: todoModel)
            addEditTodo.iClickDone()
            addEditTodo.iGotoNewTodoScreen()
            addEditTodo.iInputTodoDetail(todoModel: todoModel2)
            addEditTodo.iVerifyTodoList(todoModel: todoModel2)
            addEditTodo.iVerifyTodoDetail(todoModel: todoModel2)
            addEditTodo.iClickDone()
            deleteTodo.iDeleteTodoByType(todoType: ToDoType.shoppingCart)
        }
    }
    
    
    
//    func test_TODO_101_2() {
//        XCTContext.runActivity(named: "Input To-do detail type phone") { _ in
//            let todoType: ToDoType = ToDoType.child
//            let inputText: String = "test 101"
//            let month: MonthOfYear = MonthOfYear.July
//            let date: String = "30"
//            let year: String = "2019"
//            let expectedDate: String = "2019-07-30"
//            let todoModel = TodoModel(todoType: todoType, inputText: inputText, month: month, date: date, year: year, expectedDate: expectedDate)
//
//            addEditTodo.iGotoNewTodoScreen()
//            addEditTodo.iInputTodoDetail(todoModel: todoModel)
//        }
//    }
//
//    func test_TODO_101_3() {
//        XCTContext.runActivity(named: "Input To-do detail type shopping-cart") { _ in
//            let todoType: ToDoType = ToDoType.shoppingCart
//            let inputText: String = "test 101"
//            let month: MonthOfYear = MonthOfYear.July
//            let date: String = "30"
//            let year: String = "2019"
//            let expectedDate: String = "2019-07-30"
//            let todoModel = TodoModel(todoType: todoType, inputText: inputText, month: month, date: date, year: year, expectedDate: expectedDate)
//
//            addEditTodo.iGotoNewTodoScreen()
//            addEditTodo.iInputTodoDetail(todoModel: todoModel)
//        }
//    }
//
//    func test_TODO_101_4() {
//        XCTContext.runActivity(named: "Input To-do detail type travel") { _ in
//            let todoType: ToDoType = ToDoType.travel
//            let inputText: String = "test 101"
//            let month: MonthOfYear = MonthOfYear.July
//            let date: String = "30"
//            let year: String = "2019"
//            let expectedDate: String = "2019-07-30"
//            let todoModel = TodoModel(todoType: todoType, inputText: inputText, month: month, date: date, year: year, expectedDate: expectedDate)
//
//            addEditTodo.iGotoNewTodoScreen()
//            addEditTodo.iInputTodoDetail(todoModel: todoModel)
//        }
//    }
    
}
