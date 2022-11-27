//
//  AppDelegate.swift
//  Ex_3_21_grasp
//
//  Created by Zuleykha Pavlichenkova on 13.11.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        let viewController = ImageListAssembly.assemble()
        let window = UIWindow()
        
        window.rootViewController = viewController
        self.window = window
        window.makeKeyAndVisible()
        
        return true
    }
}

