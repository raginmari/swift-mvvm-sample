//
//  AddToDoItemCoordinatorFactory.swift
//  MVVMSample
//
//  Created by Reimar Twelker on 07.01.19.
//  Copyright © 2019 adesso mobile solutions GmbH. All rights reserved.
//

import UIKit

final class AddToDoItemCoordinatorFactory {
    
    static func makeAddToDoItemCoordinator(rootViewController: UIViewController, finishHandler: @escaping () -> Void) -> Coordinator {
        
        return AddToDoItemCoordinator(rootViewController: rootViewController, finishHandler: finishHandler)
    }
}
