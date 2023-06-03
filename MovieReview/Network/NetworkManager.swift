//
//  NetworkManager.swift
//  MovieReview
//
//  Created by KangMingyo on 2023/05/24.
//

import Foundation

enum BaseURL: String {
    case kobis = "https://kobis.or.kr/kobisopenapi/webservice/rest"
    case tmdb = "https://api.themoviedb.org"
    case poster = "https://image.tmdb.org/t/p/original"
}

enum URLPath: String {
    case searchMovie = "/movie/searchMovieList.json?key=60c9b995596ead85ff6e59a8d3725e72&movieNm="
    case searchPoster = "/3/search/movie?api_key=ab318418ee513b352deb4c9ab21f7ed7&language=ko&page=1&include_adult=false&region=KR&query="
}

enum NetworkError: Error {
    case failToParse
    case invalid
}

final class NetworkManager {

    let session: URLSessionProtocol
    
    // URLSession을 주입 받고, 테스트할 때는 MockURLSession을 주입
    init(session: URLSessionProtocol = URLSession.shared) {
        self.session = session
    }
    
    func fetchData<T: Decodable>(for url: String,
                                 dataType: T.Type,
                                 completion: @escaping (Result<T, Error>) -> Void) {
        
        guard let url = URL(string: url) else {
            return
        }
        
        let dataTask: URLSessionDataTaskProtocol = session.dataTask(with: url, completionHandler: { (data, response, error) in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            if let data = data,
               let response = response as? HTTPURLResponse,
               200..<400 ~= response.statusCode {
                do {
                    let data = try JSONDecoder().decode(T.self, from: data)
                    completion(.success(data))
                } catch {
                    completion(.failure(NetworkError.failToParse))
                }
            } else {
                completion(.failure(NetworkError.invalid))
            }
        })
        dataTask.resume()
    }
}
