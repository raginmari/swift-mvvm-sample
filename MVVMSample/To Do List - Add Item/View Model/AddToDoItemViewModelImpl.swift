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
    
    var name: String = "" {
        didSet {
            nameDidChange?(self)
            updateFormValidation()
        }
    }
    
    var nameDidChange: ((AddToDoItemViewModel) -> Void)?
    
    var dueDate: Date? {
        didSet {
            updateDueDateString(with: dueDate)
        }
    }
    
    var dueDateString: Date? {
        didSet {
            dueDateStringDidChange?(self)
        }
    }
    
    var dueDateStringDidChange: ((AddToDoItemViewModel) -> Void)?
    
    private(set) var isFormValid = false {
        didSet {
            isFormValidDidChange?(self)
        }
    }
    
    var isFormValidDidChange: ((AddToDoItemViewModel) -> Void)?
    
    init(router: AddToDoItemRouter) {
        
        self.router = router
    }
    
    private func updateDueDateString(with date: Date?) {
        
        // TODO: Format date string
    }
    
    private func updateFormValidation() {
        
        // TODO: Validate form and update `isFormValid` property
    }
    
    func cancel() {
        
        router?.cancel()
    }
}
