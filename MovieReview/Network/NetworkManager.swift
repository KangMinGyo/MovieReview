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
    
    // URLSession을 주입 받음. 테스트할 때는 MockURLSession 을 주입
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

/*
 //data : 서버에서 반환된 데이터
 //response : HTTP 헤더 및 상태 코드와 같은 응답 메타 데이터를 제공하는 객체
 func getData() {
     url = url.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
     if let url = URL(string: url) {
         let session = URLSession(configuration: .default)
         let task = session.dataTask(with: url) { (data, response, err) in
             if err != nil {
                 print("err")
                 return
             }
             
             if let data = data,
             let response = response as? HTTPURLResponse,
                200..<400 ~= response.statusCode {
                 do {
                     let decodedData = try JSONDecoder().decode(SearchData.self, from: data) //SearchData형으로 Decoding
                     self.searchData = decodedData
                     DispatchQueue.main.async {
                         self.movieSearchTableView.reloadData()
                     }
                 } catch {
                     print("")
                 }
             } else {
                 print("")
             }
         }
         task.resume()
     }
 }
 */
