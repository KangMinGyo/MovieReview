//
//  Repository.swift
//  MovieReview
//
//  Created by KangMingyo on 2023/06/12.
//

import Foundation

enum BaseURL: String {
    case kobis = "https://kobis.or.kr/kobisopenapi/webservice/rest"
    case tmdb = "https://api.themoviedb.org"
    case poster = "https://image.tmdb.org/t/p/original"
}

enum URLPath: String {
    case searchMovieURL = "/movie/searchMovieList.json?"
    case searchPosterURL = "/3/search/movie?"
    case boxOfficeURL = "/boxoffice/searchDailyBoxOfficeList.json?"
}

enum APIKey: String {
    case kobisKey = "60c9b995596ead85ff6e59a8d3725e72"
    case tmdbKey = "ab318418ee513b352deb4c9ab21f7ed7"
}

class Repository {
    private let networkManager: NetworkManager
    typealias FetchResult<T: Decodable> = Result<T, Error>
    
    init(networkManager: NetworkManager) {
        self.networkManager = networkManager
    }
    
    func fetchBoxOffice(date: String, completion: @escaping (FetchResult<BoxOffice>) -> Void) {
        var urlComponent = URLComponents(string: BaseURL.kobis.rawValue + URLPath.boxOfficeURL.rawValue)
        urlComponent?.queryItems = [
            URLQueryItem(name: "key", value: APIKey.kobisKey.rawValue),
            URLQueryItem(name: "targetDt", value: date)
        ]
        
        guard let url = urlComponent?.url else { return }
        let urlString = url.absoluteString
        print("urlString: \(urlString)")
        
        networkManager.fetchData(for: urlString,
                                 dataType: BoxOffice.self) { result in
            switch result {
            case .success(let data):
                completion(.success(data))
            case .failure(let err):
                completion(.failure(err))
            }
        }
    }
    
    func fetchMoviePoster(title: String, completion: @escaping (FetchResult<SearchPoster>) -> Void) {
        var urlComponent = URLComponents(string: BaseURL.tmdb.rawValue + URLPath.searchPosterURL.rawValue)
        urlComponent?.queryItems = [
            URLQueryItem(name: "api_key", value: APIKey.tmdbKey.rawValue),
            URLQueryItem(name: "language", value: "ko"),
            URLQueryItem(name: "page", value: "1"),
            URLQueryItem(name: "include_adult", value: "false"),
            URLQueryItem(name: "region", value: "KR"),
            URLQueryItem(name: "query", value: title),
            
        ]

        guard let url = urlComponent?.url else { return }
        let urlString = url.absoluteString
        print("urlString: \(urlString)")
        
        networkManager.fetchData(for: urlString,
                                 dataType: SearchPoster.self) { result in
            switch result {
            case .success(let data):
                completion(.success(data))
            case .failure(let err):
                completion(.failure(err))
            }
        }
    }
    
    func fetchSearchDatas(title: String, completion: @escaping (FetchResult<SearchData>) -> Void) {
        var urlComponent = URLComponents(string: BaseURL.kobis.rawValue + URLPath.searchMovieURL.rawValue)
        urlComponent?.queryItems = [
            URLQueryItem(name: "key", value: APIKey.kobisKey.rawValue),
            URLQueryItem(name: "movieNm", value: title)
        ]
        
        guard let url = urlComponent?.url else { return }
        let urlString = url.absoluteString
        print("urlString: \(urlString)")
        
        networkManager.fetchData(for: urlString,
                                 dataType: SearchData.self) { result in
            switch result {
            case .success(let data):
                completion(.success(data))
            case .failure(let err):
                completion(.failure(err))
            }
        }
    }
}
