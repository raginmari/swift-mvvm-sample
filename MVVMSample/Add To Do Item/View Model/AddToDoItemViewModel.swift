//
//  AddToDoItemViewModel.swift
//  MVVMSample
//
//  Created by Reimar Twelker on 17.12.18.
//  Copyright © 2018 adesso mobile solutions GmbH. All rights reserved.
//

import Foundation

@objc protocol AddToDoItemViewModel: AnyObject {
    
    var name: String { get set }
    var nameDidChange: ((AddToDoItemViewModel) -> Void)? { get set }
    
    var dueDateString: String? { get }
    var dueDateStringDidChange: ((AddToDoItemViewModel) -> Void)? { get set }
    var minimumDueDate: Date { get }
    
    var priorityString: String { get }
    var priorityStringDidChange: ((AddToDoItemViewModel) -> Void)? { get set }
    var orderedPriorityStrings: [String] { get }
    
    var isFormValid: Bool { get }
    var isFormValidDidChange: ((AddToDoItemViewModel) -> Void)? { get set }
    
    func selectPriority(at index: Int)
    
    func cancel()
}
