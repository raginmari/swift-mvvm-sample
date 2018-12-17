//
//  ToDoItem.swift
//  MVVMSample
//
//  Created by Reimar Twelker on 14.12.18.
//  Copyright © 2018 adesso mobile solutions GmbH. All rights reserved.
//

import Foundation

final class ToDoItem: Codable {
    
    let uuid: String
    
    var name: String
    
    var date: Date?
    
    var priority: ToDoItemPriority
    
    init(uuid: String, name: String, date: Date? = nil, priority: ToDoItemPriority = .none) {
        
        self.uuid = uuid
        self.name = name
        self.date = date
        self.priority = priority
    }
}
