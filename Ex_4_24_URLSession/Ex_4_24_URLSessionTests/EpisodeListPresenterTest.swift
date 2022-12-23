//
//  EpisodeListPresenterTest.swift
//  Ex_4_24_URLSessionTests
//
//  Created by Zuleykha Pavlichenkova on 23.12.2022.
//

import XCTest
@testable import Ex_4_24_URLSession

final class EpisodeListPresenterTest: XCTestCase {

    var episodeListPresenter: EpisodeListPresenter!
    var episodeServiceMock: EpisodeServiceMock!
    var episodeListRouterMock: EpisodeListRouterMock!
    var episodeListViewControllerMock: EpisodeListViewControllerMock!
    
    override func setUpWithError() throws {

        episodeServiceMock = EpisodeServiceMock()
        episodeListRouterMock = EpisodeListRouterMock()
        episodeListViewControllerMock = EpisodeListViewControllerMock()
        
        episodeListPresenter = EpisodeListPresenter(
            service: episodeServiceMock,
            router: episodeListRouterMock
        )
        episodeListPresenter.view = episodeListViewControllerMock
    }

    override func tearDownWithError() throws {
        episodeServiceMock = nil
        episodeListRouterMock = nil
        episodeListPresenter = nil
        episodeListViewControllerMock = nil
    }

    func testOnViewDidLoadShowsActivityIndicator() {
        
        // given
        
        
        // when
        episodeListPresenter.onViewDidLoad()
        
        // then
        XCTAssertTrue(episodeListViewControllerMock.invokedShowActivityIndicator)
    }
}
