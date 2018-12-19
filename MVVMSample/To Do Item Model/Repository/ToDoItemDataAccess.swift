//
//  ToDoItemDataAccess.swift
//  MVVMSample
//
//  Created by Reimar Twelker on 17.12.18.
//  Copyright © 2018 adesso mobile solutions GmbH. All rights reserved.
//

import Foundation

protocol ToDoItemDataAccess: AnyObject {
    
    func create(_ toDoItem: ToDoItem, completion: @escaping (Error?) -> Void)
    
    func read(withID id: String, completion: @escaping (Result<ToDoItem?>) -> Void)
    
    func readAll(completion: @escaping (Result<[ToDoItem]>) -> Void)
    
    func update(_ toDoItem: ToDoItem, completion: @escaping (Error?) -> Void)
    
    func delete(withID id: String, completion: @escaping (Error?) -> Void)
}
