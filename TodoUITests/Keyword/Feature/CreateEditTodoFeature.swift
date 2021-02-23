//
//  CreateEditTodoFeature.swift
//  TodoUITests
//
//  Created by JIRATH EAKTHITIWORRANUN on 23/2/2564 BE.
//  Copyright © 2564 BE YiGu. All rights reserved.
//

import XCTest

class CreateEditTodoFeature: XCTestCase {

    private lazy var todoListScreen = TodoListScreen()
    private lazy var todoDetailScreen = TodoDetailScreen()
    
    func iGotoNewTodoScreen() {
        todoListScreen.iClickAddNewTodo()
    }
    
    func iInputNewTodo(todoType: String, title: String, month: String, date: String, year: String) {
        todoDetailScreen.iSelectTodoType(todoType: todoType)
        todoDetailScreen.iInputTodoTitle(title: title)
        todoDetailScreen.iSelectMonthDateYear(month: month, date: date, year: year)
        todoDetailScreen.iClickDone()
    }
    
    func iVerifyLastTodoList(todoType: String, title: String, expectedDate: String) {
        todoListScreen.iVerifyLastTodoList(todoType: todoType, title: title, expectedDate: expectedDate)
    }
    
    func iVerifyTargetTodoList(todoType: String, title: String, expectedDate: String) {
        todoListScreen.iVerifyTargetTodoList(todoType: todoType, title: title, expectedDate: expectedDate)
    }
    
    func iVerifyTodoDetail(todoType: String, title: String, month: String, date: String, year: String) {
        todoDetailScreen.iVerifyTodoType(todoType: todoType)
        todoDetailScreen.iVerifyTodoTitle(title: title)
        todoDetailScreen.iVerifyDateMonthYear(month: month, date: date, year: year)
    }
    
}
