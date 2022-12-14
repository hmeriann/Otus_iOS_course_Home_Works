//
//  ImageListPresenter.swift
//  Ex_3_19_CollectionView
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
        
        // creaded the Range<Int> [0, 8]
        // Range is a sequence as Array
        // map() takes each element of the sequence and applies the func (what we wrote in {} - init() in our case) to each of the element
        // We use that func to init each of the Item
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
//        print("🥶 ", #function, indexPath)
        let imageItem = getItem(for: indexPath)
        router.showItemDetails(with: imageItem)
    }
}
