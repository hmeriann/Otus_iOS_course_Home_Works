//
//  ToDoDetailsViewController.swift
//  Ex_3_18_TableView
//
//  Created by Zuleykha Pavlichenkova on 09.11.2022.
//

import UIKit

class ToDoDetailsViewController: UIViewController {

    var language: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .green
        let languageLabel = UILabel()
        languageLabel.text = language
        languageLabel.textColor = .red
        languageLabel.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(languageLabel)
        languageLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        languageLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        languageLabel.widthAnchor.constraint(equalToConstant: 100)
        languageLabel.heightAnchor.constraint(equalToConstant: 25)
    }
}
