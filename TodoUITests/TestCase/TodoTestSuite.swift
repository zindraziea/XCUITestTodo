//
//  TodoTestSuite.swift
//  TodoUITests
//
//  Created by JIRATH EAKTHITIWORRANUN on 5/7/2564 BE.
//  Copyright © 2564 BE YiGu. All rights reserved.
//

import XCTest

class TodoTestSuite: CommonFunction {

    private lazy var app = XCUIApplication()
    private lazy var addUpdateTodoFeature = AddUpdateTodoFeature()
    private lazy var deleteTodoFeature = DeleteTodoFeature()
    
    private lazy var type: TodoType = TodoType.child
    private lazy var title: String = "TC101"
    private lazy var month: MonthOfYear = MonthOfYear.December
    private lazy var date: String = "15"
    private lazy var year: String = "2022"
    private lazy var expectedDate: String = "2022-12-15"
    private lazy var todoModel = TodoModel(type: type, title: title, month: month, date: date, year: year, expectedDate: expectedDate)
    
    override func setUpWithError() throws {
        continueAfterFailure = true
        app.launch()
    }

    override func tearDownWithError() throws {
    }

    func test_TC101_1() throws {
        XCTContext.runActivity(named: "Create new Todo-List type: phone") { _ in
            title = "TC101_1"
            todoModel = TodoModel(type: type, title: title, month: month, date: date, year: year, expectedDate: expectedDate)
            addUpdateTodoFeature.iGotoAddNewTodo()
            addUpdateTodoFeature.iInputTodoDetail(todoModel: todoModel)
            addUpdateTodoFeature.iVerifyTodoListScreen(todoModel: todoModel)
            addUpdateTodoFeature.iVerifyTodoDetailScreen(todoModel: todoModel)
        }
    }
    
    func test_TC101_2() throws {
        XCTContext.runActivity(named: "Create new Todo-List type: travel") { _ in
            title = "TC101_2"
            type = TodoType.travel
            todoModel = TodoModel(type: type, title: title, month: month, date: date, year: year, expectedDate: expectedDate)
            addUpdateTodoFeature.iGotoAddNewTodo()
            addUpdateTodoFeature.iInputTodoDetail(todoModel: todoModel)
            addUpdateTodoFeature.iVerifyTodoListScreen(todoModel: todoModel)
            addUpdateTodoFeature.iVerifyTodoDetailScreen(todoModel: todoModel)
        }
    }
    
    func test_TC102() throws {
        XCTContext.runActivity(named: "Edit description on new Todo-List") { _ in
            title = "TC102"
            todoModel = TodoModel(type: type, title: title, month: month, date: date, year: year, expectedDate: expectedDate)
            title = "EDIT_TC102"
            type = TodoType.child
            date = "2"
            month = MonthOfYear.February
            year = "2025"
            expectedDate = "2025-02-02"
            let todoModel2 = TodoModel(type: type, title: title, month: month, date: date, year: year, expectedDate: expectedDate)
            addUpdateTodoFeature.iGotoAddNewTodo()
            addUpdateTodoFeature.iInputTodoDetail(todoModel: todoModel)
            addUpdateTodoFeature.iVerifyTodoListScreen(todoModel: todoModel)
            addUpdateTodoFeature.iVerifyTodoDetailScreen(todoModel: todoModel)
            addUpdateTodoFeature.iInputTodoDetail(todoModel: todoModel2)
            addUpdateTodoFeature.iVerifyTodoListScreen(todoModel: todoModel2)
            addUpdateTodoFeature.iVerifyTodoDetailScreen(todoModel: todoModel2)
        }
    }

    func test_TC103() throws {
        XCTContext.runActivity(named: "Add new 10 Todo-List") { _ in
            for index in 1...10 {
                title = "TC103_\(index)"
                todoModel = TodoModel(type: type, title: title, month: month, date: date, year: year, expectedDate: expectedDate)
                addUpdateTodoFeature.iGotoAddNewTodo()
                addUpdateTodoFeature.iInputTodoDetail(todoModel: todoModel)
                addUpdateTodoFeature.iVerifyTodoListScreen(todoModel: todoModel)
                addUpdateTodoFeature.iVerifyTodoDetailScreen(todoModel: todoModel, clickDone: true)
            }
        }
    }
    
    func test_TC104() throws {
        XCTContext.runActivity(named: "Create new shopping-cart and phone Todo-List,Delete all shopping-cart type") { _ in
            title = "TC104_1"
            type = TodoType.shoppingCart
            todoModel = TodoModel(type: type, title: title, month: month, date: date, year: year, expectedDate: expectedDate)
            addUpdateTodoFeature.iGotoAddNewTodo()
            addUpdateTodoFeature.iInputTodoDetail(todoModel: todoModel)
            addUpdateTodoFeature.iVerifyTodoListScreen(todoModel: todoModel)
            addUpdateTodoFeature.iVerifyTodoDetailScreen(todoModel: todoModel, clickDone: true)
            title = "TC104_2"
            type = TodoType.phone
            todoModel = TodoModel(type: type, title: title, month: month, date: date, year: year, expectedDate: expectedDate)
            addUpdateTodoFeature.iGotoAddNewTodo()
            addUpdateTodoFeature.iInputTodoDetail(todoModel: todoModel)
            addUpdateTodoFeature.iVerifyTodoListScreen(todoModel: todoModel)
            addUpdateTodoFeature.iVerifyTodoDetailScreen(todoModel: todoModel, clickDone: true)
            deleteTodoFeature.iDeleteTodoListByType(type: TodoType.shoppingCart)
        }
    }
    
}
