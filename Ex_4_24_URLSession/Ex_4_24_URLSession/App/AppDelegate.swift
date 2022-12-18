//
//  AppDelegate.swift
//  Ex_4_24_URLSession
//
//  Created by Zuleykha Pavlichenkova on 18.12.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {

        let window = UIWindow()
        self.window = window

        let viewController = EpisodeListAssembly.assemble()
        
        window.rootViewController = viewController
        window.makeKeyAndVisible()
        
        return true
    }
}

