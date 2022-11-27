//
//  ImageListPresenter.swift
//  Ex_3_21_grasp
//
//  Created by Zuleykha Pavlichenkova on 25.11.2022.
//

import Foundation

protocol IImageListDataSource {
    
    var itemsCount: Int { get }
    func getItem(for indexPath: IndexPath) -> ImageItem
}

protocol IImageListPresenter {

    func userDidSelectItem(at indexPath: IndexPath)
}

final class ImageListPresenter {
   // MARK: Dependencie
    private let router: IImageListRouter
    
    // MARK: Data
    private lazy var imageItems: [ImageItem] = {

        return (0...8).map {
            ImageItem(
                imageName: "image\($0)",
                imageDescription: "Simon's cat - \($0 + 1)"
            )
        }
    }()
    
    // MARK: Init
    init(router: IImageListRouter) {
        self.router = router
    }
}

// MARK: - IImageListDataSource
extension ImageListPresenter: IImageListDataSource {

    var itemsCount: Int {
        return imageItems.count
    }
    
    func getItem(for indexPath: IndexPath) -> ImageItem {
        return imageItems[indexPath.item]
    }
}

// MARK: - IImageListPresenter
extension ImageListPresenter: IImageListPresenter {
    
    func userDidSelectItem(at indexPath: IndexPath) {
        let imageItem = getItem(for: indexPath)
        router.showItemDetails(with: imageItem)
    }
}
