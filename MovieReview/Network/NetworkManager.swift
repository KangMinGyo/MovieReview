//
//  NetworkManager.swift
//  MovieReview
//
//  Created by KangMingyo on 2023/05/24.
//

import Foundation

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
