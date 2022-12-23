//
//  EpisodeService.swift
//  Ex_4_24_URLSessionTests
//
//  Created by Zuleykha Pavlichenkova on 23.12.2022.
//

import Foundation
@testable import Ex_4_24_URLSession

class EpisodeServiceMock: IEpisodeService {

    var invokedLoadEpisodes = false
    var invokedLoadEpisodesCount = 0
    var stubbedLoadEpisodesCompletionResult: (Result<[Episode], Error>, Void)?

    func loadEpisodes(completion: @escaping (Result<[Episode], Error>) -> ()) {
        invokedLoadEpisodes = true
        invokedLoadEpisodesCount += 1
        if let result = stubbedLoadEpisodesCompletionResult {
            completion(result.0)
        }
    }
}
