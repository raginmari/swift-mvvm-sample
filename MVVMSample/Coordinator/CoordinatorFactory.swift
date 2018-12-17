//
//  CoordinatorFactory.swift
//  MVVMSample
//
//  Created by Reimar Twelker on 10.12.18.
//  Copyright © 2018 adesso mobile solutions GmbH. All rights reserved.
//

import UIKit

final class CoordinatorFactory {
    
    static func makeAppCoordinator(window: UIWindow) -> Coordinator {
        
        switch UIDevice.current.userInterfaceIdiom {
        case .phone:
            return iPhoneAppCoordinator(window: window)
        case .pad:
            fatalError("Unsupported platform")
        default:
            fatalError("Unsupported platform")
        }
    }
}
