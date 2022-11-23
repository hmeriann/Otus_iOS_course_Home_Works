//
//  ViewController.swift
//  Ex_3_19_CollectionView
//
//  Created by Zuleykha Pavlichenkova on 13.11.2022.
//
// 1. Добавьте на UIViewController UICollectionView
// 2. Создайте класс-помощник, в котором реализуйте протоколы для работы с UCollectionView. Количество столбцов на ваш выбор, но больше 1.
// 3. Добавьте модель данных, которая будет использоваться с сеткой. Класс или структура - на ваш выбор
// 4. Добавьте UICollectionViewCell. Элемент должен содержать UIImageView. Можно добавить еще пару UILabel или других контролов по желанию. Не забудьте метод для настройки cell.
// 5. Соедините все элементы, чтобы изображения выводились в сетку.

import UIKit

final class ViewController: UIViewController {
    
    // MARK: UI
    private lazy var collectionViewLayout: UICollectionViewFlowLayout = {
        let collectionViewLayout = UICollectionViewFlowLayout()
        collectionViewLayout.scrollDirection = .vertical
        collectionViewLayout.minimumLineSpacing = .zero
        collectionViewLayout.minimumInteritemSpacing = .zero
        return collectionViewLayout
    }()
    
    // тут задается коллекшенВью с вертикальным скроллингом
    private lazy var collectionView: UICollectionView = {
        
        let collectionView = UICollectionView(
            frame: .zero,
            collectionViewLayout: collectionViewLayout
        )
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(PhotoCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        
        return collectionView
    }()
    
    // MARK: Properties
    private let imageNames = [
        "image0", "image1", "image2",
    ]
    
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        print("🥶", #function)
        setUpUI()
    }

    // MARK: Private
    private func setUpUI() {
        view.addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16),
            collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16)
        ])
    }
    
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageNames.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        print("😱", indexPath)
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: "cell",
            for: indexPath
        ) as? PhotoCollectionViewCell else { return UICollectionViewCell() }
        let imageName = imageNames[indexPath.item]
        cell.configure(with: imageName)
        return cell
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        let width = (collectionView.frame.width / 2)
        return CGSize(width: width, height: width)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
           return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        }
}
