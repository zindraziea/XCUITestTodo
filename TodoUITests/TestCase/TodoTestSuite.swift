//
//  TodoTestSuite.swift
//  TodoUITests
//
//  Created by JIRATH EAKTHITIWORRANUN on 5/7/2564 BE.
//  Copyright © 2564 BE YiGu. All rights reserved.
//

import XCTest

class TodoTestSuite: XCTestCase {

    private lazy var app = XCUIApplication()
    private lazy var addUpdateTodoFeature = AddUpdateTodoFeature()
    
    override func setUpWithError() throws {
        continueAfterFailure = true
        app.launch()
    }

    override func tearDownWithError() throws {
    }

    func test_TC101_1() throws {
        XCTContext.runActivity(named: "Create new Todo-List type: phone") { _ in
            let type: String = "child"
            let title: String = "TC101_1"
            let month: String = "December"
            let date: String = "15"
            let year: String = "2022"
            let expectedDate: String = "2022-12-15"
            addUpdateTodoFeature.iGotoAddNewTodo()
            addUpdateTodoFeature.iInputTodoDetail(type: type, title: title, month: month, date: date, year: year)
            addUpdateTodoFeature.iVerifyTodoListScreen(type: type, title: title, expectedDate: expectedDate)
            addUpdateTodoFeature.iVerifyTodoDetailScreen(type: type, title: title, month: month, date: date, year: year)
        }
    }
    
    func test_TC101_2() throws {
        XCTContext.runActivity(named: "Create new Todo-List type: travel") { _ in
            let type: String = "travel"
            let title: String = "TC101_2"
            let month: String = "December"
            let date: String = "17"
            let year: String = "2022"
            let expectedDate: String = "2022-12-17"
            addUpdateTodoFeature.iGotoAddNewTodo()
            addUpdateTodoFeature.iInputTodoDetail(type: type, title: title, month: month, date: date, year: year)
            addUpdateTodoFeature.iVerifyTodoListScreen(type: type, title: title, expectedDate: expectedDate)
            addUpdateTodoFeature.iVerifyTodoDetailScreen(type: type, title: title, month: month, date: date, year: year)
        }
    }
    
    

}
