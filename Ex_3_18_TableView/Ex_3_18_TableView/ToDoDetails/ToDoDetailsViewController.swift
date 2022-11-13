//
//  ToDoDetailsViewController.swift
//  Ex_3_18_TableView
//
//  Created by Zuleykha Pavlichenkova on 09.11.2022.
//

import UIKit

class ToDoDetailsViewController: UIViewController {

    var toDo: ToDo?
    
    private lazy var toDoLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
        configure()
    }
    
    private func setUpUI() {
        toDoLabel.textColor = .purple
        view.backgroundColor = .green
        view.addSubview(toDoLabel)
        
        NSLayoutConstraint.activate([
            toDoLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 8),
            toDoLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant:  -8),
            toDoLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            toDoLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant:  -20)
        ])
    }
  
    func configure() {
        toDoLabel.text = toDo?.title
    }
    
//    func configure(with toDo: ToDo) {
//        toDoLabel.text = toDo.title
//    }
}
