//
//  AddToDoItemViewModelImpl.swift
//  MVVMSample
//
//  Created by Reimar Twelker on 17.12.18.
//  Copyright © 2018 adesso mobile solutions GmbH. All rights reserved.
//

import Foundation

final class AddToDoItemViewModelImpl: AddToDoItemViewModel {
    
    weak var router: AddToDoItemRouter?
    
    private let repository: ToDoItemRepository
    
    var name: String = "" {
        didSet {
            nameDidChange?(self)
            updateFormValidation()
        }
    }
    
    var nameDidChange: ((AddToDoItemViewModel) -> Void)?
    
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
    
    private(set) var isFormValid = false {
        didSet {
            isFormValidDidChange?(self)
        }
    }
    
    var isFormValidDidChange: ((AddToDoItemViewModel) -> Void)?
    
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
    
    init(repository: ToDoItemRepository, router: AddToDoItemRouter) {
        
        self.repository = repository
        self.router = router
    }
    
    private func updateDueDateString(with date: Date?) {
        
        // TODO: Format date string
    }
    
    private func updatePriorityString(with priority: ToDoItemPriority) {
        
        priorityString = priorityString(for: priority)
    }
    
    private func updateFormValidation() {
        
        // TODO: Validate form and update `isFormValid` property
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
