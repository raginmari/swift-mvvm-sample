//
//  ToDoItemRepositoryFactory.swift
//  MVVMSample
//
//  Created by Reimar Twelker on 14.12.18.
//  Copyright © 2018 adesso mobile solutions GmbH. All rights reserved.
//

import Foundation

final class ToDoItemRepositoryFactory {
    
    static func makeRepository() -> ToDoItemRepository {
        
        return ToDoItemRepositoryImpl()
    }
}
