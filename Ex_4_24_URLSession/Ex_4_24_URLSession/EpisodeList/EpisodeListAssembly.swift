//
//  EpisodeListAssembly.swift
//  Ex_4_24_URLSession
//
//  Created by Zuleykha Pavlichenkova on 18.12.2022.
//

import UIKit

// DEPENDENCIES INJECTION
// создает все инстансы экрана EpisodeListDetails, устанавливает между ними связи и возвращает ViewController
final class EpisodeListAssembly {
    
    static func assemble() -> UIViewController {
        // router осуществляет переходы на следующие экраны
        // (например, покажет детали выбранного из списка эпизода)
        let router = EpisodeListRouter()
        //
        let presenter = EpisodeListPresenter(router: router)
        let viewController = EpisodeListViewController(presenter: presenter)
        
        presenter.view = viewController

        let navigationViewController = UINavigationController()
        navigationViewController.viewControllers = [viewController]

        router.transitionHandler = navigationViewController
        
        return navigationViewController
    }
}
