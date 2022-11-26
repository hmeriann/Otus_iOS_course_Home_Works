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

protocol IImageListViewController {
    
}

final class ImageListViewController: UIViewController {
    
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
    
    
    // MARK: Dependencies
    private let presenter: IImageListPresenter = ImageListPresenter()
    
    // не используется, потому что VCиз сториборда этот создается
//    init(
//        presenter: IImageListPresenter
//    ) {
//        self.presenter = presenter
//    }
    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
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

// MARK: - UICollectionViewDataSource
extension ImageListViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter.itemsCount
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: "cell",
            for: indexPath
        ) as? PhotoCollectionViewCell else { return UICollectionViewCell() }
        let item = presenter.getItem(for: indexPath)
        cell.configure(with: item)
        return cell
    }
}

// MARK: - UICollectionViewDelegate
extension ImageListViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("🫣 ", #function, "indexPath", indexPath)
        let detailViewController = UIViewController() // imageDetailsViewController нужно будет сделать
        detailViewController.view.backgroundColor = .purple
        present(detailViewController, animated: true, completion: nil)
        presenter.userDidSelectItem(at: indexPath)
        
        // presenter.userDidSelectItem(at: indexPath) - сделает id (Item) объекта по indexPath,
        // а в презентере должен быть роутер / флоу координатор, который умеет показывать детали картинки или картинку крупным планом.
        // если это флоу координатор, то у него в качестве проперти будет другой флоу координатор (PictureDetailsFlowCoorinator), у которого будет метод start(), куда мы передадим этот id, на этом этапе будет показана картинка
    }
}

extension ImageListViewController: UICollectionViewDelegateFlowLayout {
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
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
    }
}
