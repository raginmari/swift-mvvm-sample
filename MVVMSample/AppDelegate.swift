//
//  AppDelegate.swift
//  MVVMSample
//
//  Created by Reimar Twelker on 14.12.18.
//  Copyright © 2018 adesso mobile solutions GmbH. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    private var appCoordinator: Coordinator!
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let window = UIWindow()
        
        if NSClassFromString("XCTest") == nil {
            appCoordinator = CoordinatorFactory.makeAppCoordinator(window: window)
            appCoordinator?.start()
        } else {
            window.rootViewController = UIViewController()
            window.makeKeyAndVisible()
        }
        
        self.window = window
        
        return true
    }
}

