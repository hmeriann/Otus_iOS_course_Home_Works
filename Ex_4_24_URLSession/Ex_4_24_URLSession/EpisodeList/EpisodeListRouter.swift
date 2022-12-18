//
//  EpisodeListRouter.swift
//  Ex_4_24_URLSession
//
//  Created by Zuleykha Pavlichenkova on 18.12.2022.
//

import Foundation

protocol IEpisodeListRouter {
    // shows details of the element
    func showEpisodeDetails(with episode: Episode)
}

final class EpisodeListRouter {
    // MARK: Dependencies
    weak var transitionHandler: ITransitionHandler?
}

// MARK: - IEpisodeListRouter
extension EpisodeListRouter: IEpisodeListRouter {
    
// TODO: 
    func showEpisodeDetails(with episode: Episode) {
//        let episodeDetailsViewController = EpisodeDetailsViewController(episode: episode)
//        transitionHandler?.present(detailViewController, animated: true, completion: nil)
    }
}
