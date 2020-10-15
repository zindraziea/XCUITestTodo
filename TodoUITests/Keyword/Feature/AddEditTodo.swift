//
//  AddEditTodo.swift
//  TodoUITests
//
//  Created by JIRATH EAKTHITIWORRANUN on 9/10/2563 BE.
//  Copyright © 2563 YiGu. All rights reserved.
//

import XCTest

class AddEditTodo: CommonFunction {
    
    private lazy var todoListScreen = TodoListScreen()
    private lazy var todoDetailScreen = TodoDetailScreen()
    
    func iGotoNewTodoScreen() {
        todoListScreen.iClickButtonAddNewTodo()
    }
    
    func iInputTodoDetail(todoModel: TodoModel) {
        todoDetailScreen.iSelectTodoType(todoType: todoModel.todoType)
        todoDetailScreen.iInputTitile(todoTitle: todoModel.todoTitle)
        todoDetailScreen.iSelectDateMonthYear(month: todoModel.month, date: todoModel.date, year: todoModel.year)
        todoDetailScreen.iClickDone()
    }
    
    func iVerifyTodoListScreen(todoModel: TodoModel) {
        todoListScreen.iVerifyTargetCell(todoTitle: todoModel.todoTitle, todoType: todoModel.todoType, expectedDate: todoModel.expectedDate)
    }
    
    func iVerifyTodoDetailScreen(todoModel: TodoModel) {
        todoDetailScreen.iVerifyTodoType(todoType: todoModel.todoType)
        todoDetailScreen.iVerifyTodoTitle(todoTitle: todoModel.todoTitle)
        todoDetailScreen.iVerifyDateMonthYear(month: todoModel.month, date: todoModel.date, year: todoModel.year)
        todoDetailScreen.iClickDone()
    }
    
}
