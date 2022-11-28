//
//  ImageListRouter.swift
//  Ex_3_19_CollectionView
//
//  Created by Zuleykha Pavlichenkova on 28.11.2022.
//

import Foundation

protocol IImageListRouter {
    // shows details of the element
    func showItemDetails(with imageItem: ImageItem)
}

final class ImageListRouter {
    // MARK: Dependencies
    weak var transitionHandler: ITransitionHandler?
}

// MARK: - IImageListRouter
extension ImageListRouter: IImageListRouter {
    
    func showItemDetails(with imageItem: ImageItem) {
        let detailViewController = ImageDetailsViewController(imageItem: imageItem)
        transitionHandler?.present(detailViewController, animated: true, completion: nil)
    }
}
