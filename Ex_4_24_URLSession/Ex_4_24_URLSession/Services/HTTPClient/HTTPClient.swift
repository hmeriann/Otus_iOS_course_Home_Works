//
//  HTTPClient.swift
//  Ex_4_24_URLSession
//
//  Created by Zuleykha Pavlichenkova on 20.12.2022.
//

import Foundation

enum HTTPClientError: Error {
    // client-side / netwok error
    case dataTaskError(Error)
    // server-side error
    case unknownResponse
    case noDataInResponse
    case badStatusCode(Int)
    case decodingError(DecodingError)
}

protocol IHTTPClient {
    
    @discardableResult
    func load(
        _ request: URLRequest,
        completion: @escaping (Result<Data, Error>) -> Void
    ) -> URLSessionDataTask
}

final class HTTPClient {
    
    let session: URLSessionProtocol
    
    //MARK: - Init
    init(session: URLSessionProtocol = URLSession.shared) {
        self.session = session
    }
}

//MARK: - IHHTPClient

extension HTTPClient: IHTTPClient {
    
    @discardableResult
    func load(
        _ request: URLRequest,
        completion: @escaping (Result<Data, Error>) -> Void
    ) -> URLSessionDataTask {
        
        let dataTask = session.dataTask(with: request) { [weak self] optionalData, optionalResponse, optionalError in
            self?.handleDataTaskCompletion(
                optionalData,
                optionalResponse,
                optionalError,
                completion
            )
        }
        
        dataTask.resume()
        return dataTask
    }
}

private extension HTTPClient {
    
    func handleDataTaskCompletion(
        _ optionalData: Data?,
        _ optionalResponse: URLResponse?,
        _ optionalError: Error?,
        _ completion: @escaping (Result<Data, Error>) -> Void
    ) {
        // client-side / netwok error
        if let error = optionalError {
            completion(.failure(HTTPClientError.dataTaskError(error)))
        }
        
        // server-side error
        guard let httpResponse = optionalResponse as? HTTPURLResponse else {
            completion(.failure(HTTPClientError.unknownResponse))
            return
        }
        guard 200 ..< 300 ~= httpResponse.statusCode else {
            completion(.failure(HTTPClientError.badStatusCode(httpResponse.statusCode)))
            return
        }
        
        guard let data = optionalData else {
            completion(.failure(HTTPClientError.noDataInResponse ))
            return
        }
        completion(.success(data))
    }
}
