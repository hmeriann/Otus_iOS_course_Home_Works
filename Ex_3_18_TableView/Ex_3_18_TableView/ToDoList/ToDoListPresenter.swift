//
//  ToDoListPresenter.swift
//  Ex_3_18_TableView
//
//  Created by Zuleykha Pavlichenkova on 13.11.2022.
//

import UIKit

final class ToDoListPresenter: NSObject {
    
    weak var viewController: UIViewController?

    let items: [ToDo] = [
        ToDo(title: "Make photos"),
        ToDo(title: "Print applications"),
        ToDo(title: "Do the HW")
    ]
}

// MARK: - UITableViewDelegate

extension ToDoListPresenter: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let toDoDetailsViewController = ToDoDetailsViewController()
        let itemToPresentDetails = items[indexPath.row]
        toDoDetailsViewController.toDo = itemToPresentDetails
        viewController?.present(toDoDetailsViewController, animated: true)
//        print("PRESENTER", #function,"\(itemToPresentDetails)")
    }
}

// MARK: - UITableViewDataSource

extension ToDoListPresenter: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: "ToDoTableViewCell",
            for: indexPath
        ) as? ToDoTableViewCell else { return UITableViewCell() }
        
        let item = items[indexPath.row]
        cell.configure(with: item)
        
        return cell
    }
}
