//
//  DeleteTodoFeature.swift
//  TodoUITests
//
//  Created by JIRATH EAKTHITIWORRANUN on 16/3/2564 BE.
//  Copyright © 2564 BE YiGu. All rights reserved.
//

import XCTest

class DeleteTodoFeature: CommonUtils {
    private lazy var todoListScreen = TodoListScreen()
    private lazy var todoDetailScreen = TodoDetailScreen()
    
    func iRemoveType(todoType: TodoType) {
        todoListScreen.iClickEdit()
        todoListScreen.iRemoveTodoType(todoType: todoType)
    }
}
