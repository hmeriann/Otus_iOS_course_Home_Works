//
//  EpisodeListRouter.swift
//  Ex_4_24_URLSession
//
//  Created by Zuleykha Pavlichenkova on 18.12.2022.
//

import UIKit

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
        
        let episodeDetailsViewController = UIViewController()
        episodeDetailsViewController.view.backgroundColor = .yellow
        episodeDetailsViewController.title = episode.name
        
        // TODO: add Assembly for EpisodeDetails module to assemble Episode Detail view
        
        transitionHandler?.pushViewController(episodeDetailsViewController, animated: true)
        
//        let episodeDetailsViewController = EpisodeDetailsViewController(episode: episode)
//        transitionHandler?.present(episodeDetailsViewController, animated: true, completion: nil)
    }
}
