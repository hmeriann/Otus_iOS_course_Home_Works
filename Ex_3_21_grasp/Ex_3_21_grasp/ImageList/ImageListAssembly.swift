//
//  ImageListAssembly.swift
//  Ex_3_21_grasp
//
//  Created by Zuleykha Pavlichenkova on 27.11.2022.
//

import UIKit

// DEPENDENCIES INJECTION
// создает все инстансы экрана ImageDetails, устанавливает между ними связи и возвращает ViewController
final class ImageListAssembly {
    static func assemble() -> UIViewController {
        let router = ImageListRouter()
        let presenter = ImageListPresenter(router: router)
        let viewController = ImageListViewController(presenter: presenter)
        router.transitionHandler = viewController
        
        return viewController
    }
}
