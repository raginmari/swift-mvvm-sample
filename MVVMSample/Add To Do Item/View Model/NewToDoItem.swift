//
//  NewToDoItem.swift
//  MVVMSample
//
//  Created by Reimar Twelker on 17.12.18.
//  Copyright © 2018 adesso mobile solutions GmbH. All rights reserved.
//

import Foundation

struct NewToDoItem {
    
    var name: String = ""
    
    var dueDate: Date?
    
    var priority: ToDoItemPriority = .none
}
