//
//  EpisodeRequest.swift
//  Ex_4_24_URLSession
//
//  Created by Zuleykha Pavlichenkova on 20.12.2022.
//

import Foundation

/// Создает конкретный URLRequest с эндпойнта
struct EpisodeRequest {
    
    // to check an alert breake the URL
    static let episodesUrlString = "https://rickandmortyapi.com/api/episode"

    static func makeURLRequest() -> URLRequest {
        
        guard let episodesUrl = URL(string: EpisodeRequest.episodesUrlString) else {
            fatalError("Cannot create URL from \(EpisodeRequest.episodesUrlString)")
        }
        let urlRequest = URLRequest(url: episodesUrl)
        
        return urlRequest
    }
}
