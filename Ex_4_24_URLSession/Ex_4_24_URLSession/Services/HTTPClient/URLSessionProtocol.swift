//
//  URLSessionProtocol.swift
//  Ex_4_24_URLSession
//
//  Created by Zuleykha Pavlichenkova on 20.12.2022.
//

import Foundation

protocol URLSessionProtocol {
    
    func dataTask(
        with url: URLRequest,
        completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void
    ) -> URLSessionDataTask
}

extension URLSession: URLSessionProtocol {}
