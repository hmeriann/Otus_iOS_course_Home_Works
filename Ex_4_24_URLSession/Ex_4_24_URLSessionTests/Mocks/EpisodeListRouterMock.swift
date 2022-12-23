//
//  EpisodeListRouterMock.swift
//  Ex_4_24_URLSessionTests
//
//  Created by Zuleykha Pavlichenkova on 23.12.2022.
//

import Foundation
@testable import Ex_4_24_URLSession

class EpisodeListRouterMock: IEpisodeListRouter {

    var invokedShowEpisodeDetails = false
    var invokedShowEpisodeDetailsCount = 0
    var invokedShowEpisodeDetailsParameters: (episode: Episode, Void)?
    var invokedShowEpisodeDetailsParametersList = [(episode: Episode, Void)]()

    func showEpisodeDetails(with episode: Episode) {
        invokedShowEpisodeDetails = true
        invokedShowEpisodeDetailsCount += 1
        invokedShowEpisodeDetailsParameters = (episode, ())
        invokedShowEpisodeDetailsParametersList.append((episode, ()))
    }
}
