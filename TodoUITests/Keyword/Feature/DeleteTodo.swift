//
//  DeleteTodo.swift
//  TodoUITests
//
//  Created by JIRATH EAKTHITIWORRANUN on 29/9/2563 BE.
//  Copyright © 2563 YiGu. All rights reserved.
//

import XCTest

class DeleteTodo: CommonFunction {
    
    let todoListScreen = TodoListScreen()
    
    func iDeleteTodoByType(todoType: ToDoType) {
        todoListScreen.iClickEdit()
        todoListScreen.iDeleteTodoByType(todoType: todoType)
        todoListScreen.iClickDone()
    }
    
}
