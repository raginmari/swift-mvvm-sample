//
//  ToDoListItemViewModel.swift
//  MVVMSample
//
//  Created by Reimar Twelker on 14.12.18.
//  Copyright © 2018 adesso mobile solutions GmbH. All rights reserved.
//

import Foundation

class ToDoListItemViewModel: NSObject {
    
    let uuid: String
    
    let title: String
    
    let dueDateString: String?
    
    let priorityString: String?
    
    init(uuid: String, title: String, dueDateString: String? = nil, priorityString: String? = nil) {
        
        self.uuid = uuid
        self.title = title
        self.dueDateString = dueDateString
        self.priorityString = priorityString
    }
}
