//
//  InMemoryToDoItemDAO.swift
//  MVVMSample
//
//  Created by Reimar Twelker on 17.12.18.
//  Copyright © 2018 adesso mobile solutions GmbH. All rights reserved.
//

import Foundation

final class InMemoryToDoItemDAO: ToDoItemDataAccess {
    
    private static var toDoItems: [ToDoItem] = []
    
    func create(_ toDoItem: ToDoItem, completion: @escaping (Error?) -> Void) {
        
        guard !existsToDoItem(withID: toDoItem.uuid) else {
            completion(ToDoItemDataAccessError.conflict)
            return
        }
        
        InMemoryToDoItemDAO.toDoItems.append(toDoItem)
        completion(nil)
    }
    
    private func existsToDoItem(withID id: String) -> Bool {
        
        return InMemoryToDoItemDAO.toDoItems.first(where: { $0.uuid == id }) != nil
    }
    
    func read(withID id: String, completion: @escaping (Result<ToDoItem?>) -> Void) {
        
        let toDoItem = InMemoryToDoItemDAO.toDoItems.first { $0.uuid == id }
        completion(.success(toDoItem))
    }
    
    func readAll(completion: @escaping (Result<[ToDoItem]>) -> Void) {
        
        completion(.success(InMemoryToDoItemDAO.toDoItems))
    }
    
    func update(_ toDoItem: ToDoItem, completion: @escaping (Error?) -> Void) {
        
        guard let existingToDoItem = InMemoryToDoItemDAO.toDoItems.first(where: { $0.uuid == toDoItem.uuid }) else {
            completion(ToDoItemDataAccessError.notFound)
            return
        }
        
        existingToDoItem.name = toDoItem.name
        existingToDoItem.date = toDoItem.date
        existingToDoItem.priority = toDoItem.priority
        
        completion(nil)
    }
    
    func delete(withID id: String, completion: @escaping (Error?) -> Void) {
        
        guard let index = InMemoryToDoItemDAO.toDoItems.index(where: { $0.uuid == id }) else {
            completion(ToDoItemDataAccessError.notFound)
            return
        }
        
        InMemoryToDoItemDAO.toDoItems.remove(at: index)
        completion(nil)
    }
}
