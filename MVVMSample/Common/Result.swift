//
//  Result.swift
//  MVVMSample
//
//  Created by Reimar Twelker on 14.12.18.
//  Copyright © 2018 adesso mobile solutions GmbH. All rights reserved.
//

import Foundation

enum Result<T> {
    
    case success(T)
    case failure(Error)
    
    var value: T? {
        
        if case let .success(value) = self {
            return value
        }
        
        return nil
    }
}
