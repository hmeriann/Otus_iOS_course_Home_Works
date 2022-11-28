//
//  ImageDetailsViewController.swift
//  Ex_3_19_CollectionView
//
//  Created by Zuleykha Pavlichenkova on 26.11.2022.
//

import UIKit

protocol IImageDetailsView: AnyObject {
    func configure(with imageItem: ImageItem)
    func dismiss()
}

final class ImageDetailsViewController: UIViewController {
    
    // MARK: UI
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        return stackView
    }()
        
    // MARK: Dependencies
    let presenter: IImageDetailsPresenter
    
    // MARK: init
    init(presenter: IImageDetailsPresenter) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
        presenter.onViewDidLoad()
    }
    
    private func setUpUI() {
        view.backgroundColor = .white
        view.addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 4),
            stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 4),
            stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -4)
        ])

        stackView.addArrangedSubview(imageView)
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            title: "Close",
            style: .plain,
            target: self,
            action: #selector(closeTapped)
        )
    }
    
    @objc func closeTapped() {
        presenter.onCloseButtonTapped()
    }
}

extension ImageDetailsViewController: IImageDetailsView {
    func dismiss() {
        dismiss(animated: true)
    }
    
    func configure(with imageItem: ImageItem) {
        imageView.image = UIImage(named: imageItem.imageName)
        title = imageItem.imageDescription
    }
}
