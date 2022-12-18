//
//   UIViewController+TransitionHandler.swift
//  Ex_4_24_URLSession
//
//  Created by Zuleykha Pavlichenkova on 18.12.2022.
//

import UIKit

protocol ITransitionHandler: AnyObject {
    func present(_ viewControllerToPresent: UIViewController,
        animated flag: Bool,
      completion: (() -> Void)?)
}

// retroactive modelling
extension UIViewController: ITransitionHandler { }
