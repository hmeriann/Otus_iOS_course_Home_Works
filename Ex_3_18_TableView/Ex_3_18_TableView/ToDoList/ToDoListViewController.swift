//
//  ViewController.swift
//  Ex_3_18_TableView
//
//  Created by Zuleykha Pavlichenkova on 06.11.2022.
//
// 1. Добавьте на UIViewController UITableView.
// 2. Создайте класс-помощник, в котором реализуйте протоколы для работы с UITableView.
// 3. Добавьте модель данных, которая будет использоваться со списком. Класс или структура - на ваш выбор
// 4. Добавьте UITableViewCell. Элемент должен содержать все контролы, нужны для вывода информации.
// 5. Соедините все элементы, чтобы данные выводились в список.
// 6. Добавьте второй UIViewController. На него завестайте несколько контролов, в которые будет выводиться информация из выбранного элемента.
// 7. По тапу на элемент строки нужно открывать второй UIViewController и передавать данные выбранного элемента.

import UIKit

final class ToDoListViewController: UIViewController {
    
    // MARK: Dependencies
    private lazy var presenter: ToDoListPresenter = {
        let presenter = ToDoListPresenter()
        presenter.viewController = self
        return presenter
    }()
    
    // MARK: UI
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = presenter
        tableView.delegate = presenter
        tableView.register(
            ToDoTableViewCell.self,
            forCellReuseIdentifier: "ToDoTableViewCell"
        )
        
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
    }
    
    private func setUpUI() {
        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
}
