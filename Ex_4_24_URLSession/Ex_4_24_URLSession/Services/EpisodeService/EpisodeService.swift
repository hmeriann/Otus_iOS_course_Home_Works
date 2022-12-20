//
//  EpisodeService.swift
//  Ex_4_24_URLSession
//
//  Created by Zuleykha Pavlichenkova on 20.12.2022.
//

import Foundation

/// Сервис для загрузки эпизодов с https://rickandmortyapi.com/api/episode
protocol IEpisodeService {
    
    func loadEpisodes(completion: @escaping (Result<[Episode], Error>) -> ())
}

final class EpisodeService {
    
    //MARK: - Dependencie
    private let httpClient: IHTTPClient
    private let jsonDecoder = JSONDecoder()
        
    //MARK: Init
    init(httpClient: IHTTPClient) {
        self.httpClient = httpClient
    }
}

// MARK: - IEpisodeService

extension EpisodeService: IEpisodeService {
    
    func loadEpisodes(completion: @escaping (Result<[Episode], Error>) -> ()) {
        
        let episodeRequest = EpisodeRequest.makeURLRequest()
        httpClient.load(episodeRequest) { [weak self] httpRequestResult in
            guard let self = self else { return }
            switch httpRequestResult {
            case .success(let data):
                do {
                    // когда предают тип, пишут Тип.self
                    let episodeResponse = try self.jsonDecoder.decode(EpisodeResponse.self, from: data)
                    
                    completion(.success(episodeResponse.episodes))

                } catch let decodingError {
                    completion(.failure(decodingError))
                }
            case .failure(let httpClientError):
                completion(.failure(httpClientError))
            }
        }
    }
}
