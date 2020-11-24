//
//  DeleteTodoFeature.swift
//  TodoUITests
//
//  Created by JIRATH EAKTHITIWORRANUN on 24/11/2563 BE.
//  Copyright © 2563 YiGu. All rights reserved.
//

import XCTest

class DeleteTodoFeature: CommonFunction {
    private lazy var todoListScreen = TodoListScreen()
    
    func iDeleteTodoByType(type: TodoType) {
        todoListScreen.iClickEdit()
        todoListScreen.iDeleteTodoByType(type: type)
    }
    
}
