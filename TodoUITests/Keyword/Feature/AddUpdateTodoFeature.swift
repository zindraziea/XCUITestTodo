//
//  AddUpdateTodoFeature.swift
//  TodoUITests
//
//  Created by JIRATH EAKTHITIWORRANUN on 5/7/2564 BE.
//  Copyright © 2564 BE YiGu. All rights reserved.
//

import XCTest

class AddUpdateTodoFeature: XCTestCase {
    
    private lazy var todoListScreen = TodoListScreen()
    private lazy var todoDetailScreen = TodoDetailScreen()
    
    func iGotoAddNewTodo() {
        todoListScreen.iClickAddNewTodo()
    }
    
    func iInputTodoDetail(type: String, title: String, month: String, date: String, year: String) {
        todoDetailScreen.iClickBtnbyType(type: type)
        todoDetailScreen.iInputTitle(title: title)
        todoDetailScreen.iSelectMonth(month: month)
        todoDetailScreen.iSelectDate(date: date)
        todoDetailScreen.iSelectYear(year: year)
        todoDetailScreen.iClickDone()
    }
    
    func iVerifyTodoListScreen(type: String, title: String, expectedDate: String) {
        todoListScreen.iVerifyLastTodoList(type: type, title: title, expectedDate: expectedDate)
    }
    
    func iVerifyTodoDetailScreen(type: String, title: String, month: String, date: String, year: String) {
        todoDetailScreen.iVerifyType(type: type)
        todoDetailScreen.iVerifyTitle(title: title)
        todoDetailScreen.iVerifyMonth(month: month)
        todoDetailScreen.iVerifyDate(date: date)
        todoDetailScreen.iVerifyYear(year: year)
    }
    
}
