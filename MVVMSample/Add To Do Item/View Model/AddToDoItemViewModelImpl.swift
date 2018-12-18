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
    
    let name = Observable<String?>("")
    
    private var dueDate: Date? {
        didSet {
            updateDueDateString(with: dueDate)
        }
    }
    
    var dueDateString: String? {
        didSet {
            dueDateStringDidChange?(self)
        }
    }
    
    var dueDateStringDidChange: ((AddToDoItemViewModel) -> Void)?
    
    var minimumDueDate: Date {
        
        return Date()
    }
    
    let isFormValid = Observable(false)
    
    private var priority: ToDoItemPriority = .none {
        didSet {
            updatePriorityString(with: priority)
        }
    }
    
    var priorityString: String = NSLocalizedString("unwichtig", comment: "") {
        didSet {
            priorityStringDidChange?(self)
        }
    }
    
    var priorityStringDidChange: ((AddToDoItemViewModel) -> Void)?
    
    private lazy var orderedPriorities: [ToDoItemPriority] = {
        
        return [ .none, .low, .medium, .high ]
    }()
    
    lazy var orderedPriorityStrings: [String] = {
        
        return orderedPriorities.map(priorityString)
    }()
    
    init(repository: ToDoItemRepository, router: AddToDoItemRouter) {
        
        self.repository = repository
        self.router = router
        
        setUpBindings()
    }
    
    private func setUpBindings() {
        
        _ = name.observeNext { [weak self] value in
            self?.updateFormValidation()
        }
    }
    
    private func priorityString(for priority: ToDoItemPriority) -> String {
        
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
    
    private func updatePriorityString(with priority: ToDoItemPriority) {
        
        priorityString = priorityString(for: priority)
    }
    
    private func updateFormValidation() {
        
        switch name.value {
        case let value? where value.isEmpty:
            isFormValid.value = false
        case nil:
            isFormValid.value = false
        default:
            isFormValid.value = true
        }
    }
    
    func selectPriority(at index: Int) {
        
        guard case (0..<orderedPriorities.count) = index else {
            assertionFailure("Index out of bounds")
            return
        }
        
        priority = orderedPriorities[index]
    }
    
    func cancel() {
        
        router?.cancel()
    }
}
