//
//  EpisodeListPresenter.swift
//  Ex_4_24_URLSession
//
//  Created by Zuleykha Pavlichenkova on 18.12.2022.
//

import Foundation

protocol IEpisodeListDataSource {
    
    var itemsCount: Int { get }
    func getEpisode(for indexPath: IndexPath) -> Episode
}

protocol IEpisodeListPresenter {

    func userDidSelectItem(at indexPath: IndexPath)
}

final class EpisodeListPresenter {

    // MARK: Dependencie
    private let router: IEpisodeListRouter
    weak var view: IEpisodeListViewController?
    
    // MARK: Data
    private lazy var episodes: [Episode] = {

        return (0...8).map {
            Episode(
                id: $0,
                name: "Episode \($0)"
            )
        }
    }()
    
    // MARK: Init
    init(router: IEpisodeListRouter) {
        self.router = router
    }
}

// MARK: - IEpisodeListDataSource
extension EpisodeListPresenter: IEpisodeListDataSource {

    var itemsCount: Int {
        return episodes.count
    }
    
    func getEpisode(for indexPath: IndexPath) -> Episode {
        return episodes[indexPath.item]
    }
}

// MARK: - IEpisodeListPresenter
extension EpisodeListPresenter: IEpisodeListPresenter {
    
    func userDidSelectItem(at indexPath: IndexPath) {
        let episode = getEpisode(for: indexPath)
        router.showEpisodeDetails(with: episode)
    }
}
