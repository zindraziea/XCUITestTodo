//
//  DeleteTodo.swift
//  TodoUITests
//
//  Created by JIRATH EAKTHITIWORRANUN on 14/10/2563 BE.
//  Copyright © 2563 YiGu. All rights reserved.
//

import XCTest

class DeleteTodo: CommonFunction {
    
    let todoListScreen = TodoListScreen()
    
    func iDeleteTodoByType(todoType: TodoType) {
        todoListScreen.iDeleteTodoByType(todoType: todoType)
    }
}
