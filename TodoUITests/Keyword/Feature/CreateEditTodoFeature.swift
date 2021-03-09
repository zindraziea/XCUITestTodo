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
    
    func iInputNewTodo(todoModel: TodoModel) {
        todoDetailScreen.iSelectTodoType(todoType: todoModel.type.rawValue)
        todoDetailScreen.iInputTodoTitle(title: todoModel.title)
        todoDetailScreen.iSelectMonthDateYear(month: todoModel.month.rawValue, date: todoModel.date, year: todoModel.year)
        todoDetailScreen.iClickDone()
    }
    
    func iVerifyLastTodoList(todoModel: TodoModel) {
        todoListScreen.iVerifyLastTodoList(todoType: todoModel.type.rawValue, title: todoModel.title, expectedDate: todoModel.expectedDate)
    }
    
    func iVerifyTargetTodoList(todoModel: TodoModel) {
        todoListScreen.iVerifyTargetTodoList(todoType: todoModel.type.rawValue, title: todoModel.title, expectedDate: todoModel.expectedDate)
    }
    
    func iVerifyTodoDetail(todoModel: TodoModel) {
        todoDetailScreen.iVerifyTodoType(todoType: todoModel.type.rawValue)
        todoDetailScreen.iVerifyTodoTitle(title: todoModel.title)
        todoDetailScreen.iVerifyDateMonthYear(month: todoModel.month.rawValue, date: todoModel.date, year: todoModel.year)
    }
    
}
