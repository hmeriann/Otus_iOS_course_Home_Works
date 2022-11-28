//
//  UIViewController+TransitionHandler.swift
//  Ex_3_19_CollectionView
//
//  Created by Zuleykha Pavlichenkova on 28.11.2022.
//


import UIKit

protocol ITransitionHandler: AnyObject {
    func present(_ viewControllerToPresent: UIViewController,
        animated flag: Bool,
      completion: (() -> Void)?)
}

// retroactive modelling
extension UIViewController: ITransitionHandler { }
