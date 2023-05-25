//
//  MovieSearchViewModel.swift
//  MovieReview
//
//  Created by KangMingyo on 2023/05/25.
//

import UIKit

class MovieSearchViewModel {
    
    private let networkManager: NetworkManager
    var searchData: SearchData?
    
    init(networkManager: NetworkManager) {
        self.networkManager = networkManager
    }
    
    func getSearchDatas() {
        var url = "https://kobis.or.kr/kobisopenapi/webservice/rest/movie/searchMovieList.json?key=60c9b995596ead85ff6e59a8d3725e72&movieNm=범죄도시"
        url = url.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        
        networkManager.fetchData(for: url,
                                  dataType: SearchData.self) { [weak self] result in
            switch result {
            case .success(let data):
                self?.searchData = data
                print(data)
            case .failure(_):
                print("err")
            }
        }
    }
}

