//
//  ToDoTableViewCell.swift
//  Ex_3_18_TableView
//
//  Created by Zuleykha Pavlichenkova on 09.11.2022.
//

import UIKit

final class ToDoTableViewCell: UITableViewCell {
    
    private lazy var toDoLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpUI()
    }
    
    private func setUpUI() {
        toDoLabel.textColor = .red
        self.addSubview(toDoLabel)
        NSLayoutConstraint.activate([
            toDoLabel.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            toDoLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant:  -8),
            toDoLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            toDoLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant:  -20)
        ])
    }
    
    // from storyboard
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setUpUI()
    }
    
    func configure(with toDo: ToDo) {
        toDoLabel.text = toDo.title
    }
}
