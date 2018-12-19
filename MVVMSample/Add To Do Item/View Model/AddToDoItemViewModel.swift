//
//  AddToDoItemViewModel.swift
//  MVVMSample
//
//  Created by Reimar Twelker on 17.12.18.
//  Copyright © 2018 adesso mobile solutions GmbH. All rights reserved.
//

import Foundation
import Bond

protocol AddToDoItemViewModel: AnyObject {
    
    /// The name of the new to do item. Observable.
    var name: Observable<String> { get }
    
    var dueDateString: String? { get }
    var dueDateStringDidChange: ((AddToDoItemViewModel) -> Void)? { get set }
    var minimumDueDate: Date { get }
    
    var priorityString: String { get }
    var priorityStringDidChange: ((AddToDoItemViewModel) -> Void)? { get set }
    var orderedPriorityStrings: [String] { get }
    
    /// Whether the data entered into the form can be used to create the to do item. Observable.
    var isFormValid: Observable<Bool> { get }
    
    /// Updates the selected priority of the new to do item.
    ///
    /// - Parameter index: The index of the selected priority in the `orderedPriorityStrings` property.
    func selectPriority(at index: Int)
    
    /// Cancels the view.
    func cancel()
}
