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
    
    init(window: UIWindow) {
        
        self.window = window
    }
    
    func start() {
        
        let viewController = ToDoListFactory.makeToDoList(router: self)
        let navigationController = UINavigationController(rootViewController: viewController)
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
        
        rootViewController = navigationController
    }
}

extension iPhoneAppCoordinator: ToDoListRouter {
    
    func addToDoItem() {
        
        print("Add new item")
    }
}
