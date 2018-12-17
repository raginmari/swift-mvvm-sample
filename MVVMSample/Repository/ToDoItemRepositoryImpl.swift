//
//  ToDoItemRepositoryImpl.swift
//  MVVMSample
//
//  Created by Reimar Twelker on 14.12.18.
//  Copyright © 2018 adesso mobile solutions GmbH. All rights reserved.
//

import Foundation

final class ToDoItemRepositoryImpl: ToDoItemRepository {
    
    private static var toDoItems: [ToDoItem] = []
    
    func createOrUpdateToDoItem(_ toDoItem: ToDoItem, handler: @escaping (Error?) -> Void) {
        
        if let existingToDoItem = ToDoItemRepositoryImpl.toDoItems.first(where: { $0.uuid == toDoItem.uuid }) {
            existingToDoItem.name = toDoItem.name
            existingToDoItem.date = toDoItem.date
            existingToDoItem.priority = toDoItem.priority
        } else {
            ToDoItemRepositoryImpl.toDoItems.append(toDoItem)
        }
        
        save()
        DispatchQueue.main.async {
            handler(nil)
        }
    }
    
    func deleteToDoItem(_ toDoItem: ToDoItem, handler: @escaping (Error?) -> Void) {
        
        guard let index = ToDoItemRepositoryImpl.toDoItems.index(where: { $0.uuid == toDoItem.uuid }) else {
            handler(nil)
            return
        }
        
        ToDoItemRepositoryImpl.toDoItems.remove(at: index)
        
        save()
        DispatchQueue.main.async {
            handler(nil)
        }
    }
    
    func allToDoItems(handler: @escaping (Result<[ToDoItem]>) -> Void) {
        
//        let toDoItems = ToDoItemRepositoryImpl.toDoItems
        
        let toDoItems = [
            ToDoItem(uuid: UUID().uuidString, name: "Item 1"),
            ToDoItem(uuid: UUID().uuidString, name: "Item 2"),
            ToDoItem(uuid: UUID().uuidString, name: "Item 3")
        ]
        
        DispatchQueue.main.async {
            handler(.success(toDoItems))
        }
    }
    
    func toDoItem(withID uuid: String, handler: @escaping (Result<ToDoItem?>) -> Void) {
        
        let toDoItem = ToDoItemRepositoryImpl.toDoItems.first(where: { $0.uuid == uuid })
        
        DispatchQueue.main.async {
            handler(.success(toDoItem))
        }
    }
    
    private func save() {
        
    }
}
