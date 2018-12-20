//
//  AddToDoItemViewModelImpl.swift
//  MVVMSample
//
//  Created by Reimar Twelker on 17.12.18.
//  Copyright © 2018 adesso mobile solutions GmbH. All rights reserved.
//

import Foundation
import Bond

final class AddToDoItemViewModelImpl: AddToDoItemViewModel {
    
    /// Handles the navigation events of the component.
    weak var router: AddToDoItemRouter?
    
    /// Provides access to the to do item model.
    private let repository: ToDoItemRepository
    
    // MARK: Signals
    
    let name = Observable("")
    
    let dueDateString = Observable(NSLocalizedString("egal", comment: ""))
    
    let priorityString = Observable(NSLocalizedString("unwichtig", comment: ""))
    
    let isFormValid = Observable(false)
    
    // MARK: Readonly properties
    
    var minimumDueDate: Date {
        
        return Date()
    }
    
    lazy var orderedPriorityStrings: [String] = {
        
        return orderedPriorities.map(localizedPriorityString)
    }()
    
    // MARK: Private properties
    
    private var dueDate: Date? {
        didSet {
            updateDueDateString(with: dueDate)
        }
    }
    
    private let priority = Observable<ToDoItemPriority>(.none)
    
    private lazy var orderedPriorities: [ToDoItemPriority] = {
        
        return [ .none, .low, .medium, .high ]
    }()
    
    // MARK: -
    
    init(repository: ToDoItemRepository, router: AddToDoItemRouter) {
        
        self.repository = repository
        self.router = router
        
        setUpBindings()
    }
    
    private func setUpBindings() {
        
        // If the name changes, update the form validity
        name.map { !$0.isEmpty }.bind(to: isFormValid)
        
        // If the priority changes, update its string representation
        priority.map(localizedPriorityString).bind(to: priorityString)
    }
    
    private func localizedPriorityString(for priority: ToDoItemPriority) -> String {
        
        switch priority {
        case .none:
            return NSLocalizedString("unwichtig", comment: "")
        case .low:
            return NSLocalizedString("nicht so wichtig", comment: "")
        case .medium:
            return NSLocalizedString("schon recht wichtig", comment: "")
        case .high:
            return NSLocalizedString("ziemlich wichtig", comment: "")
        }
    }
    
    private func updateDueDateString(with date: Date?) {
        
        // TODO: Format date string
    }
    
    func selectPriority(at index: Int) {
        
        guard case 0..<orderedPriorities.count = index else {
            assertionFailure("Index out of bounds")
            return
        }
        
        priority.value = orderedPriorities[index]
    }
    
    func cancel() {
        
        router?.cancel()
    }
}
