//
//  ImageDetailsPresenter.swift
//  Ex_3_19_CollectionView
//
//  Created by Zuleykha Pavlichenkova on 28.11.2022.
//

import Foundation

protocol IImageDetailsPresenter {
    func onViewDidLoad()
}

final class ImageDetailsPresenter {
    
    private var imageItem: ImageItem

    // MARK: Dependencies
    weak var view: IImageDetailsView?
    
    init(imageItem: ImageItem) {
        self.imageItem = imageItem
    }
}

extension ImageDetailsPresenter: IImageDetailsPresenter {
    func onViewDidLoad() {
        view?.configure(with: imageItem)
    }
    
    
}
