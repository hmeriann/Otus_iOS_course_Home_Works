//
//  Episode.swift
//  Ex_4_24_URLSession
//
//  Created by Zuleykha Pavlichenkova on 18.12.2022.
//

import Foundation

struct Info: Decodable {

    let count: Int
    let pages: Int
    let next: String?
    let prev: String?
}

struct Episode: Decodable {
 
    let id: Int
    let name: String
    let airDate: String
    let episode: String
    let characters: [URL]
    let url: URL
    
    enum CodingKeys: String, CodingKey {
  
        case id
        case name
        case airDate = "air_date"
        case episode
        case characters
        case url
    }
}

// они все должны быть Decodable, чтобы можно было использовать в decode()
struct EpisodeResponse: Decodable {

    let info: Info
    let episodes: [Episode]
    
    enum CodingKeys: String, CodingKey {
        case episodes = "results"
        case info
    }
}
