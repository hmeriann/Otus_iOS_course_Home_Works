//
//  UIViewController+TransitionHandler.swift
//  Ex_3_21_grasp
//
//  Created by Zuleykha Pavlichenkova on 27.11.2022.
//

import UIKit

protocol ITransitionHandler: AnyObject {
    func present(_ viewControllerToPresent: UIViewController,
        animated flag: Bool,
      completion: (() -> Void)?)
}

// retroactive modelling
extension UIViewController: ITransitionHandler { }
