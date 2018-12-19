//
//  iPhoneAppCoordinator.swift
//  MVVMSample
//
//  Created by Reimar Twelker on 10.12.18.
//  Copyright © 2018 adesso mobile solutions GmbH. All rights reserved.
//

import UIKit

final class iPhoneAppCoordinator: Coordinator {
    
    private let window: UIWindow
    
    private weak var rootViewController: UIViewController?
    
    private weak var currentAddToDoItemViewController: UIViewController?
    
    init(window: UIWindow) {
        
        self.window = window
    }
    
    func start() {
        
        // TODO: Remove when in-memory DAO is replaced
        let repository = ToDoItemRepositoryFactory.makeRepository()
        repository.createOrUpdateToDoItem(ToDoItem(uuid: UUID().uuidString, name: "Item 1")) { _ in }
        repository.createOrUpdateToDoItem(ToDoItem(uuid: UUID().uuidString, name: "Item 2")) { _ in }
        repository.createOrUpdateToDoItem(ToDoItem(uuid: UUID().uuidString, name: "Item 3")) { _ in }
        
        let viewController = ToDoListFactory.makeToDoList(router: self)
        let navigationController = UINavigationController(rootViewController: viewController)
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
        
        rootViewController = navigationController
    }
}

extension iPhoneAppCoordinator: ToDoListRouter {
    
    func addToDoItem() {
        
        let viewController = AddToDoItemFactory.makeAddToDoItemView(router: self)
        let navigationController = UINavigationController(rootViewController: viewController)
        rootViewController?.present(navigationController, animated: true)
        
        currentAddToDoItemViewController = navigationController
    }
}

extension iPhoneAppCoordinator: AddToDoItemRouter {
    
    func cancel() {
        
        currentAddToDoItemViewController?.dismiss(animated: true)
    }
    
    func finish() {
        
        currentAddToDoItemViewController?.dismiss(animated: true)
    }
}
