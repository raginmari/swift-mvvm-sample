//
//  AddToDoItemFactory.swift
//  MVVMSample
//
//  Created by Reimar Twelker on 17.12.18.
//  Copyright © 2018 adesso mobile solutions GmbH. All rights reserved.
//

import UIKit

final class AddToDoItemFactory {
    
    static func makeAddToDoItemView(router: AddToDoItemRouter) -> UIViewController {
        
        let storyboard = UIStoryboard(name: "AddToDoItemView", bundle: nil)
        guard let viewController = storyboard.instantiateInitialViewController() as? AddToDoItemViewController else {
            fatalError("Failed to load view")
        }
        
        viewController.viewModel = makeAddToDoItemViewModel(router: router)
        
        return viewController
    }
    
    static func makeAddToDoItemViewModel(router: AddToDoItemRouter) -> AddToDoItemViewModel {
        
        let repository = ToDoItemRepositoryFactory.makeRepository()
        return AddToDoItemViewModelImpl(repository: repository, router: router)
    }
}
