//
//  ImageDetailsAssembly.swift
//  Ex_3_19_CollectionView
//
//  Created by Zuleykha Pavlichenkova on 28.11.2022.
//

import UIKit

final class ImageDetailsAssembly {
    
    func assemble(imageItem: ImageItem) -> UIViewController {
        let presenter = ImageDetailsPresenter(imageItem: imageItem)
        let detailViewController = ImageDetailsViewController(presenter: presenter)
        presenter.view = detailViewController
        
        return detailViewController
    }
}
