//
//  CreateTodoTestSuite.swift
//  TodoUITests
//
//  Created by Thannaphat Atinonthanakorn on 27/1/2564 BE.
//  Copyright © 2564 BE YiGu. All rights reserved.
//

import XCTest

class CreateTodoTestSuite: CommonUtils {

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

    func test101_2() {
        XCTContext.runActivity(named: "Create new Todo-List: phone") { _ in
            todoType = TodoType.phone
            todoModel = TodoModel(title: title, month: month, date: date, year: year, expectedDate: expectedDate, type: todoType)
            createEditTodoFeature.iGotoNewTodoScreen()
            createEditTodoFeature.iInputNewTodo(todoModel: todoModel)
            createEditTodoFeature.iVerifyTargetTodoList(todoModel: todoModel)
            createEditTodoFeature.iVerifyTodoDetail(todoModel: todoModel)
        }
    }

    func test101_3() {
        XCTContext.runActivity(named: "Create new Todo-List: shopping cart") { _ in
            todoType = TodoType.shopping_cart
            todoModel = TodoModel(title: title, month: month, date: date, year: year, expectedDate: expectedDate, type: todoType)
            createEditTodoFeature.iGotoNewTodoScreen()
            createEditTodoFeature.iInputNewTodo(todoModel: todoModel)
            createEditTodoFeature.iVerifyTargetTodoList(todoModel: todoModel)
            createEditTodoFeature.iVerifyTodoDetail(todoModel: todoModel)
        }
    }

    func test101_4() {
        XCTContext.runActivity(named: "Create new Todo-List: travel") { _ in
            todoType = TodoType.travel
            todoModel = TodoModel(title: title, month: month, date: date, year: year, expectedDate: expectedDate, type: todoType)
            createEditTodoFeature.iGotoNewTodoScreen()
            createEditTodoFeature.iInputNewTodo(todoModel: todoModel)
            createEditTodoFeature.iVerifyTargetTodoList(todoModel: todoModel)
            createEditTodoFeature.iVerifyTodoDetail(todoModel: todoModel)
        }
    }
    
    func test102() {
        XCTContext.runActivity(named: "Edit description on new Todo-List") { _ in
            createEditTodoFeature.iGotoNewTodoScreen()
            createEditTodoFeature.iInputNewTodo(todoModel: todoModel)
            createEditTodoFeature.iVerifyTargetTodoList(todoModel: todoModel)
            createEditTodoFeature.iVerifyTodoDetail(todoModel: todoModel)
            title = "test 102"
            month = MonthOfYear.December
            date = "12"
            year = "2030"
            expectedDate = "2030-12-12"
            todoType = TodoType.phone
            let todoModel2 = TodoModel(title: title, month: month, date: date, year: year, expectedDate: expectedDate, type: todoType)
            createEditTodoFeature.iInputNewTodo(todoModel: todoModel2)
            createEditTodoFeature.iVerifyTargetTodoList(todoModel: todoModel2)
            createEditTodoFeature.iVerifyTodoDetail(todoModel: todoModel2)
        }
    }
    
    func test103() {
        XCTContext.runActivity(named: "Add new 10 Todo-List") { _ in
            for index in 1...10 {
                title = "test 103 iteration \(index)"
                todoModel = TodoModel(title: title, month: month, date: date, year: year, expectedDate: expectedDate, type: todoType)
                createEditTodoFeature.iGotoNewTodoScreen()
                createEditTodoFeature.iInputNewTodo(todoModel: todoModel)
                createEditTodoFeature.iVerifyTargetTodoList(todoModel: todoModel)
                createEditTodoFeature.iVerifyTodoDetail(todoModel: todoModel)
                createEditTodoFeature.iClickDone()
            }
        }
    }
    
    func test104() {
        XCTContext.runActivity(named: "Crete new shopping-cart and phone Todo-List, Delete all shopping-cart type") { _ in
            
        }
    }

}
