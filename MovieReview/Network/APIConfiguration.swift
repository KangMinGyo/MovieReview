//
//  APIConfiguration.swift
//  MovieReview
//
//  Created by KangMingyo on 2023/06/07.
//

import Foundation

struct APIConfiguration {
    private let baseURL: String
    private let paramList: [URLQueryItem]
    private let path: String
    
    init(
        baseURL: BaseURL,
        path: URLPath,
        param: [String : Any]
    ) {
        self.baseURL = baseURL.rawValue
        self.path = path.rawValue
        self.paramList = param.queryItems
    }
    
    func makeURL() -> String {
        var urlComponent = URLComponents(string: baseURL + path)
        urlComponent?.queryItems = paramList
        let url = urlComponent?.url
        let urlString = url?.absoluteString
        return urlString?.urlEncoding() ?? ""
    }
}

