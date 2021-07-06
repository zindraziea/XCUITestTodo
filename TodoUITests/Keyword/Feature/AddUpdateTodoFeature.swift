//
//  AddUpdateTodoFeature.swift
//  TodoUITests
//
//  Created by JIRATH EAKTHITIWORRANUN on 5/7/2564 BE.
//  Copyright © 2564 BE YiGu. All rights reserved.
//

import XCTest

class AddUpdateTodoFeature: CommonFunction {
    
    private lazy var todoListScreen = TodoListScreen()
    private lazy var todoDetailScreen = TodoDetailScreen()
    
    func iGotoAddNewTodo() {
        todoListScreen.iClickAddNewTodo()
    }
    
    func iInputTodoDetail(todoModel: TodoModel) {
        todoDetailScreen.iClickBtnbyType(type: todoModel.type.rawValue)
        todoDetailScreen.iInputTitle(title: todoModel.title)
        todoDetailScreen.iSelectMonth(month: todoModel.month.rawValue)
        todoDetailScreen.iSelectDate(date: todoModel.date)
        todoDetailScreen.iSelectYear(year: todoModel.year)
        todoDetailScreen.iClickDone()
    }
    
    func iVerifyTodoListScreen(todoModel: TodoModel) {
        todoListScreen.iVerifyLastTodoList(type: todoModel.type.rawValue, title: todoModel.title, expectedDate: todoModel.expectedDate)
    }
    
    func iVerifyTodoDetailScreen(todoModel: TodoModel, clickDone: Bool=false) {
        todoDetailScreen.iVerifyType(type: todoModel.type.rawValue)
        todoDetailScreen.iVerifyTitle(title: todoModel.title)
        todoDetailScreen.iVerifyMonth(month: todoModel.month.rawValue)
        todoDetailScreen.iVerifyDate(date: todoModel.date)
        todoDetailScreen.iVerifyYear(year: todoModel.year)
        if clickDone {
            todoDetailScreen.iClickDone()
        }
    }
    
}
