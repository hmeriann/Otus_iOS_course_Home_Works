//
//  ImageListPresenter.swift
//  Ex_3_19_CollectionView
//
//  Created by Zuleykha Pavlichenkova on 25.11.2022.
//

import Foundation

protocol IImageListPresenter {
    var itemsCount: Int { get }
    func getItem(for indexPath: IndexPath) -> Item
    func userDidSelectItem(at indexPath: IndexPath)
}

final class ImageListPresenter {
   
    private lazy var imageItems: [Item] = {
        
        // creaded the Range<Int> [0, 8]
        // Range is a sequence as Array
        // map() takes each element of the sequence and applies the func (what we wrote in {} - init() in our case) to each of the element
        // We use that func to init each of the Item
        return (0...8).map {
            Item(
                imageName: "image\($0)",
                imageDescription: "Simon's cat - \($0 + 1)"
            )
        }
    }()
}

// MARK: - IImageListPresenter
extension ImageListPresenter: IImageListPresenter {

    var itemsCount: Int {
        return imageItems.count
    }
    
    func getItem(for indexPath: IndexPath) -> Item {
        return imageItems[indexPath.item]
    }
}

extension ImageListPresenter {
    
    func userDidSelectItem(at indexPath: IndexPath) {
        print("🥶 ", #function, indexPath)
    }
}
