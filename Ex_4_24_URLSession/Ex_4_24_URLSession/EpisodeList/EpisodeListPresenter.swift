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
    private let router: IEpisodeListRouter
    weak var view: IEpisodeListViewController?
    
    // MARK: Data
    private lazy var episodes: [Episode] = {

        return []
//        return (0...8).map {
//            Episode(
//                id: $0,
//                name: "Episode \($0)",
//                airDate: ""
//            )
//        }
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
        
        let urlSession = URLSession.shared
        let episodesUrl = URL(string: "https://rickandmortyapi.com/api/episode")!
        let dataTask = urlSession.dataTask(
            with: episodesUrl
        ) { optionalData, optionalResponse, optionalError in
            let data = optionalData!
            let dataString = String(data: data, encoding: .utf8)
            
            let jsonDecoder = JSONDecoder()
            // когда предают тип, пишут Тип.self
            do {
                let episodeResponse = try jsonDecoder.decode(EpisodeResponse.self, from: data)
//                episodeResponse.episodes.forEach { episode in
//                    print(episode)
//                }
                print(episodeResponse.episodes[0])
                print(episodeResponse.info)
            } catch let decodingError {
                print(decodingError)
            }
        }
        dataTask.resume()
    }
}
