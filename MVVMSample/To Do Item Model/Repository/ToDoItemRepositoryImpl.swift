//
//  ToDoItemRepositoryImpl.swift
//  MVVMSample
//
//  Created by Reimar Twelker on 14.12.18.
//  Copyright © 2018 adesso mobile solutions GmbH. All rights reserved.
//

import Foundation

final class ToDoItemRepositoryImpl: ToDoItemRepository {
    
    func createOrUpdateToDoItem(_ toDoItem: ToDoItem, handler: @escaping (Error?) -> Void) {
        
    }
    
    func deleteToDoItem(_ toDoItem: ToDoItem, handler: @escaping (Error?) -> Void) {
        
    }
    
    func allToDoItems(handler: @escaping (Result<[ToDoItem]>) -> Void) {
        
    }
    
    func toDoItem(withID uuid: String, handler: @escaping (Result<ToDoItem?>) -> Void) {
        
    }
}
