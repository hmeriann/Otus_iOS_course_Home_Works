//
//  Episode.swift
//  Ex_4_24_URLSession
//
//  Created by Zuleykha Pavlichenkova on 18.12.2022.
//

import Foundation

//struct Info {
//    let count : Int
//    let pages : Int
//    let next : String?
//    let prev : String?
//}

struct Episode {
    let id : Int
    let name : String
//    let air_date : String?
//    let episode : String?
//    let characters : [String]?
//    let url : String?
//    let created : String?
}

struct EpisodeResponse {
//    let info: Info не будем парсить
    let episodes: [Episode]
}
