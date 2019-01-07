//
//  AddToDoItemCoordinator.swift
//  MVVMSample
//
//  Created by Reimar Twelker on 07.01.19.
//  Copyright © 2019 adesso mobile solutions GmbH. All rights reserved.
//

import UIKit

final class AddToDoItemCoordinator: Coordinator {
    
    private let rootViewController: UIViewController
    
    /// Uses a single delegate closure instead of a fully-fledged delegate protocol dependency.
    private let finishHandler: () -> Void
    
    init(rootViewController: UIViewController, finishHandler: @escaping () -> Void) {
        
        self.rootViewController = rootViewController
        self.finishHandler = finishHandler
    }
    
    func start() {
        
        let viewController = AddToDoItemFactory.makeAddToDoItemView(router: self)
        let navigationController = UINavigationController(rootViewController: viewController)
        rootViewController.present(navigationController, animated: true)
    }
}

extension AddToDoItemCoordinator: AddToDoItemRouter {
    
    func finish() {
        
        rootViewController.dismiss(animated: true)
        finishHandler()
    }
    
    func cancel() {
        
        rootViewController.dismiss(animated: true)
        finishHandler()
    }
}
