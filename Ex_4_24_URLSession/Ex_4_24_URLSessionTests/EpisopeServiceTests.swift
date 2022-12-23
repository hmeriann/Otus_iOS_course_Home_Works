//
//  EpisopeServiceTests.swift
//  Ex_4_24_URLSessionTests
//
//  Created by Zuleykha Pavlichenkova on 23.12.2022.
//

import XCTest
@testable import Ex_4_24_URLSession

final class EpisopeServiceTests: XCTestCase {
    
    var episodeService: EpisodeService!
    var httpClientMock: HTTPClientMock!
    
    override func setUpWithError() throws {
        httpClientMock = HTTPClientMock()
        episodeService = EpisodeService(httpClient: httpClientMock)
    }

    override func tearDownWithError() throws {
       
    }
    
    // Checks the func loadEpisodes(): при вызове метода он передаст апрос в HTTP клиеннт
    func testOnLoadEpisodes() {
        
        // given
        let dataTask = URLSessionDataTask()
        httpClientMock.stubbedLoadResult = dataTask
        
        // when
        episodeService.loadEpisodes { _ in
            print(#function)
        }
        
        // then
        XCTAssertTrue(httpClientMock.invokedLoad)
        XCTAssertEqual(httpClientMock.invokedLoadCount, 1)
        let invokedRequest = httpClientMock.invokedLoadParameters?.request
        XCTAssertEqual(invokedRequest?.url?.absoluteString, "https://rickandmortyapi.com/api/episode")
    }
}
