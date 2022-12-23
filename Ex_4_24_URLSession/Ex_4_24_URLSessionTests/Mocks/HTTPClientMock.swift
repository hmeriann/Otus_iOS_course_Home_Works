//
//  HTTPClientMock.swift
//  Ex_4_24_URLSessionTests
//
//  Created by Zuleykha Pavlichenkova on 23.12.2022.
//

import Foundation
@testable import Ex_4_24_URLSession

class HTTPClientMock: IHTTPClient {

    var invokedLoad = false
    var invokedLoadCount = 0
    var invokedLoadParameters: (request: URLRequest, Void)?
    var invokedLoadParametersList = [(request: URLRequest, Void)]()
    var stubbedLoadCompletionResult: (Result<Data, Error>, Void)?
    var stubbedLoadResult: URLSessionDataTask!

    func load(
        _ request: URLRequest,
        completion: @escaping (Result<Data, Error>) -> Void
    ) -> URLSessionDataTask {
        invokedLoad = true
        invokedLoadCount += 1
        invokedLoadParameters = (request, ())
        invokedLoadParametersList.append((request, ()))
        if let result = stubbedLoadCompletionResult {
            completion(result.0)
        }
        return stubbedLoadResult
    }
}
