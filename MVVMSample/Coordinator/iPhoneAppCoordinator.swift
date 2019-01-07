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
    
    /// Reference to the current child coordinator or `nil` if the user is not currently adding a todo item.
    private var addToDoItemCoordinator: Coordinator?
    
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
        
        // Start child coordinator
        guard let rootViewController = rootViewController else { return }
        addToDoItemCoordinator = AddToDoItemCoordinatorFactory.makeAddToDoItemCoordinator(rootViewController: rootViewController) { [weak self] in
            self?.addToDoItemCoordinator = nil
        }
        
        addToDoItemCoordinator?.start()
    }
}
