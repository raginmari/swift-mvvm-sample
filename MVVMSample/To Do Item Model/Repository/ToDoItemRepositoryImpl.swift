//
//  ToDoItemRepositoryImpl.swift
//  MVVMSample
//
//  Created by Reimar Twelker on 14.12.18.
//  Copyright © 2018 adesso mobile solutions GmbH. All rights reserved.
//

import Foundation

final class ToDoItemRepositoryImpl: ToDoItemRepository {
    
    private let dao: ToDoItemDataAccess
    
    init(dao: ToDoItemDataAccess) {
        
        self.dao = dao
    }
    
    func createOrUpdateToDoItem(_ toDoItem: ToDoItem, completion: @escaping (Error?) -> Void) {
        
        withExistingToDoItem(toDoItem) { [weak dao] existingToDoItem in
            guard let dao = dao else { return }
            if existingToDoItem != nil {
                dao.update(toDoItem, completion: completion)
            } else {
                dao.create(toDoItem, completion: completion)
            }
        }
    }
    
    private func withExistingToDoItem(_ toDoItem: ToDoItem, perform handler: @escaping (ToDoItem?) -> Void) {
        
        dao.read(withID: toDoItem.uuid) { result in
            let existingToDoItem = result.value ?? nil // Unwrap double optional
            handler(existingToDoItem)
        }
    }
    
    func deleteToDoItem(_ toDoItem: ToDoItem, completion: @escaping (Error?) -> Void) {
        
        withExistingToDoItem(toDoItem) { [weak dao] existingToDoItem in
            guard existingToDoItem != nil else {
                completion(nil)
                return
            }
            
            guard let dao = dao else { return }
            dao.delete(withID: toDoItem.uuid, completion: completion)
        }
    }
    
    func allToDoItems(completion: @escaping (Result<[ToDoItem]>) -> Void) {
        
        dao.readAll(completion: completion)
    }
    
    func toDoItem(withID id: String, completion: @escaping (Result<ToDoItem?>) -> Void) {
        
        dao.read(withID: id, completion: completion)
    }
}
