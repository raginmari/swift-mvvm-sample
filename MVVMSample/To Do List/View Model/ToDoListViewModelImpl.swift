//
//  DefaultToDoListViewModel.swift
//  MVVMSample
//
//  Created by Reimar Twelker on 14.12.18.
//  Copyright © 2018 adesso mobile solutions GmbH. All rights reserved.
//

import Foundation

final class ToDoListViewModelImpl: ToDoListViewModel {
    
    private let repository: ToDoItemRepository
    
    private(set) var toDoItems: [ToDoListItemViewModel] = [] {
        didSet {
            toDoItemsDidChange?(self)
        }
    }
    
    var toDoItemsDidChange: ((ToDoListViewModel) -> Void)?
    
    weak var router: ToDoListRouter?
    
    init(repository: ToDoItemRepository, router: ToDoListRouter) {
        
        self.repository = repository
        self.router = router
    }
    
    func prepareView() {
        
        repository.allToDoItems { [weak self] result in
            switch result {
            case let .success(toDoItems):
                self?.processToDoItems(toDoItems)
            case .failure:
                // TODO: Handle error
                break
            }
        }
    }
    
    private func processToDoItems(_ toDoItems: [ToDoItem]) {
        
        self.toDoItems = toDoItems.map(makeToDoListItemViewModel)
    }
    
    private func makeToDoListItemViewModel(toDoItem: ToDoItem) -> ToDoListItemViewModel {
        
        // TODO: Convert due date and priority to string
        
        return ToDoListItemViewModel(uuid: toDoItem.uuid, title: toDoItem.name, dueDateString: nil, priorityString: nil)
    }
    
    func addToDoItem() {
        
        router?.addToDoItem()
    }
}
