//
//  EpisodeListPresenter.swift
//  Ex_4_24_URLSession
//
//  Created by Zuleykha Pavlichenkova on 18.12.2022.
//

import Foundation

// Presenter предоставляет VC данные для отображения количества элементов
protocol IEpisodeListDataSource {
    
    var itemsCount: Int { get }
    func getEpisode(for indexPath: IndexPath) -> Episode
}

// View Controller делегирует Презентеру реакцию на нажатие на элемент
protocol IEpisodeListPresenter {

    func onViewDidLoad()
    func userDidSelectItem(at indexPath: IndexPath)
}

final class EpisodeListPresenter {

    // MARK: Dependencies
    private let service: IEpisodeService
    private let router: IEpisodeListRouter
    weak var view: IEpisodeListViewController?
    
    // MARK: Data
    private var episodes: [Episode] = []
    
    // MARK: Init
    init(
        service: IEpisodeService,
        router: IEpisodeListRouter
    ) {
        self.service = service
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
    
    func onViewDidLoad() {
        loadEpisodes()
    }
    
    func userDidSelectItem(at indexPath: IndexPath) {
        let episode = getEpisode(for: indexPath)
        router.showEpisodeDetails(with: episode)
    }
}

private extension EpisodeListPresenter {
    
    func loadEpisodes() {
        service.loadEpisodes { [weak self] episodesResult in
            
            guard let self = self else { return }
            switch episodesResult {
            case .success(let episodes):
                self.episodes = episodes
                DispatchQueue.main.async {
                    self.view?.updateUI()
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}
