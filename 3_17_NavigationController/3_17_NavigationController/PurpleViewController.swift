//
//  PurpleViewController.swift
//  3_17_NavigationController
//
//  Created by Zuleykha Pavlichenkova on 06.11.2022.
//

import Foundation
import UIKit

final class PurpleViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("🟣", #function)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("🟣", #function)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("🟣", #function)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        print("🟣", #function)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        print("🟣", #function)
    }
}
