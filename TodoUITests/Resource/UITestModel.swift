//
//  UITestModel.swift
//  TodoUITests
//
//  Created by JIRATH EAKTHITIWORRANUN on 28/9/2563 BE.
//  Copyright © 2563 YiGu. All rights reserved.
//

import XCTest

struct TodoModel {
    let todoType: ToDoType
    let inputText: String
    let month: MonthOfYear
    let date: String
    let year: String
    let expectedDate: String
}
