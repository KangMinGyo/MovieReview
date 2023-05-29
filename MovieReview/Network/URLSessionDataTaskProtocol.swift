//
//  URLSessionDataTaskProtocol.swift
//  MovieReview
//
//  Created by KangMingyo on 2023/05/29.
//

import Foundation

protocol URLSessionDataTaskProtocol {
    func resume()
}

extension URLSessionDataTask: URLSessionDataTaskProtocol {}
