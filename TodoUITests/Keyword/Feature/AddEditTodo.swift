//
//  AddEditTodo.swift
//  TodoUITests
//
//  Created by JIRATH EAKTHITIWORRANUN on 28/9/2563 BE.
//  Copyright © 2563 YiGu. All rights reserved.
//

import XCTest

class AddEditTodo: CommonFunction {

    let todoListScreen = TodoListScreen()
    let todoDetailScreen = TodoDetailScreen()
    
    func iGotoNewTodoScreen() {
        todoListScreen.iClickAddNewTodo()
    }
    
    func iInputTodoDetail(todoModel: TodoModel) {
        todoDetailScreen.iClickTodoType(todoType: todoModel.todoType)
        todoDetailScreen.iInputTodoTitleLabel(inputText: todoModel.inputText)
        todoDetailScreen.iInputMonthDateYear(month: todoModel.month, date: todoModel.date, year: todoModel.year)
        todoDetailScreen.iClickDone()
    }
    
    func iVerifyTodoList(todoModel: TodoModel) {
        todoListScreen.iVerifyLastTodoList(todoModel: todoModel)
    }
    
    func iVerifyTodoDetail(todoModel: TodoModel) {
        todoDetailScreen.iVerifyTodoType(todoType: todoModel.todoType)
        todoDetailScreen.iVerifyTodoTitleLabel(inputText: todoModel.inputText)
        todoDetailScreen.iVerifyMonthDateYear(month: todoModel.month, date: todoModel.date, year: todoModel.year)
    }
    
    func iClickDone() {
        todoDetailScreen.iClickDone()
    }

}
