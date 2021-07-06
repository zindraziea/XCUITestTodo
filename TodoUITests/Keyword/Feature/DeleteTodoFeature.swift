//
//  DeleteTodoFeature.swift
//  TodoUITests
//
//  Created by JIRATH EAKTHITIWORRANUN on 6/7/2564 BE.
//  Copyright © 2564 BE YiGu. All rights reserved.
//

import XCTest

class DeleteTodoFeature: CommonFunction {
    
    private lazy var todoListScreen = TodoListScreen()
    
    func iDeleteTodoListByType(type: TodoType) {
        todoListScreen.iClickEdit()
        todoListScreen.iDeleteTodoListByType(type: type)
        todoListScreen.iClickDone()
    }
}
