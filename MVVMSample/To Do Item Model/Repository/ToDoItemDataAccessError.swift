//
//  ToDoItemDataAccessError.swift
//  MVVMSample
//
//  Created by Reimar Twelker on 19.12.18.
//  Copyright © 2018 adesso mobile solutions GmbH. All rights reserved.
//

import Foundation

enum ToDoItemDataAccessError: Error {
    
    /// A to do item already exists and cannot be created.
    case conflict
    
    /// A to do item does not exist and cannot be updated.
    case notFound
}
