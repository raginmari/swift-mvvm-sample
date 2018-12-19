//
//  ToDoItemRepository.swift
//  MVVMSample
//
//  Created by Reimar Twelker on 14.12.18.
//  Copyright © 2018 adesso mobile solutions GmbH. All rights reserved.
//

import Foundation

protocol ToDoItemRepository {
    
    func createOrUpdateToDoItem(_ toDoItem: ToDoItem, completion: @escaping (Error?) -> Void)
    
    func deleteToDoItem(_ toDoItem: ToDoItem, completion: @escaping (Error?) -> Void)
    
    func allToDoItems(completion: @escaping (Result<[ToDoItem]>) -> Void)
    
    func toDoItem(withID id: String, completion: @escaping (Result<ToDoItem?>) -> Void)
}
