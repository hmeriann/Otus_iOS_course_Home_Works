//
//  AppDelegate.swift
//  Ex_3_19_CollectionView
//
//  Created by Zuleykha Pavlichenkova on 13.11.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let router = ImageListRouter()
        let presenter = ImageListPresenter(router: router)
        let viewController = ImageListViewController(presenter: presenter)
        router.transitionHandler = viewController
        
        
        let window = UIWindow()
        window.rootViewController = viewController
        window.makeKeyAndVisible()
        self.window = window
        
        return true
    }

}

