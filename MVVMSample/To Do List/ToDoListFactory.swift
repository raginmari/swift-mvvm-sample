//
//  ToDoListFactory.swift
//  MVVMSample
//
//  Created by Reimar Twelker on 14.12.18.
//  Copyright © 2018 adesso mobile solutions GmbH. All rights reserved.
//

import UIKit

final class ToDoListFactory {
    
    static func makeToDoList(router: ToDoListRouter) -> UIViewController {
        
        let storyboard = UIStoryboard(name: "ToDoListView", bundle: nil)
        guard let viewController = storyboard.instantiateInitialViewController() as? ToDoListViewController else {
            fatalError("Failed to load view")
        }
        
        viewController.viewModel = makeToDoListViewModel(router: router)
        
        return viewController
    }
    
    static func makeToDoListViewModel(router: ToDoListRouter) -> ToDoListViewModel {
 
        let repository = ToDoItemRepositoryFactory.makeRepository()
        return ToDoListViewModelImpl(repository: repository, router: router)
    }
}
