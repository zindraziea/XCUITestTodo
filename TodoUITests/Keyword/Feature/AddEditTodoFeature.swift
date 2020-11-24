//
//  AddEditTodoFeature.swift
//  TodoUITests
//
//  Created by JIRATH EAKTHITIWORRANUN on 24/11/2563 BE.
//  Copyright © 2563 YiGu. All rights reserved.
//

import XCTest

class AddEditTodoFeature: CommonFunction {
    private lazy var app = XCUIApplication()
    private lazy var todoListScreen = TodoListScreen()
    private lazy var todoDetailScreen = TodoDetailScreen()
    
    func iGotoNewTodoScreen() {
        todoListScreen.iClickButtonAddNewTodo()
    }
    
    func iInputNewTodo(todoModel: TodoModel) {
        todoDetailScreen.iSelectTodoType(todoType: todoModel.type)
        todoDetailScreen.iInputTodoTitle(title: todoModel.title)
        todoDetailScreen.iInputMonth(month: todoModel.month)
        todoDetailScreen.iInputDate(date: todoModel.date)
        todoDetailScreen.iInputYear(year: todoModel.year)
        todoDetailScreen.iClickDone()
    }
    
    func iVerifyLastTodoList(todoModel: TodoModel) {
        todoListScreen.iVerifyLastTodoList(todoModel: todoModel)
    }
    
    func iVerifyTargetCell(todoModel: TodoModel) {
        todoListScreen.iVerifyTargetCell(todoModel: todoModel)
    }
    
    func iVerifyTodoDetail(todoModel: TodoModel) {
        todoDetailScreen.iVerifyTodoType(todoType: todoModel.type)
        todoDetailScreen.iVerifyTodoTitle(title: todoModel.title)
        todoDetailScreen.iVerifyMothDateYear(month: todoModel.month, date: todoModel.date, year: todoModel.year)
    }
    
    func iClickDone() {
        todoDetailScreen.iClickDone()
    }
}
