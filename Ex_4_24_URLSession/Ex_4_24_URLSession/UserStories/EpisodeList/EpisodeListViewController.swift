//
//  EpisodeListViewController.swift
//  Ex_4_24_URLSession
//
//  Created by Zuleykha Pavlichenkova on 18.12.2022.
//

import UIKit

// конформит AnyObject, чтобы можно было понять, что это класс,
// и поэтому объект этого клааса может быть weak var
protocol IEpisodeListViewController: AnyObject {
    
    func updateUI()
    func showError(message: String)
    func showActivityIndicator()
    func hideActivityIndicator()
}

private extension String {
    static let episodeCellIdentifier = "episodeCellIdentifier"
}

final class EpisodeListViewController: UIViewController {
    
    // MARK: UI
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(
            EpisodeTableViewCell.self,
            forCellReuseIdentifier: .episodeCellIdentifier
        )
        
        return tableView
    }()
    
    // MARK: Dependencies
    // потому что items count есть только в протоколе IEpisodeListDataSource
    private let presenter: IEpisodeListPresenter & IEpisodeListDataSource
    
    init(
        presenter: IEpisodeListPresenter & IEpisodeListDataSource
    ) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
        presenter.onViewDidLoad()
    }

    // MARK: Private
    private func setUpUI() {
        view.addSubview(tableView)
        view.backgroundColor = .systemBackground
        title = "List of Episodes"
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16)
        ])
    }
}

extension EpisodeListViewController: IEpisodeListViewController {
    
    func updateUI() {
        
        tableView.reloadData()
    }
    
    func showError(message: String) {
        
        let alert = UIAlertController(
            title: "Error",
            message: message,
            preferredStyle: .alert
        )
        let action = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    func showActivityIndicator() {
        print(#function)
    }
    
    func hideActivityIndicator() {
        print(#function)
    }
}

extension EpisodeListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.itemsCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: .episodeCellIdentifier, for: indexPath) as? EpisodeTableViewCell else {
            return UITableViewCell()
        }
        let episode = presenter.getEpisode(for: indexPath)
        cell.configure(with: episode)
        return cell
    }
}

extension EpisodeListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        presenter.userDidSelectItem(at: indexPath)
    }
}
