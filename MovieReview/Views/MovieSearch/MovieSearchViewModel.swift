//
//  MovieSearchViewModel.swift
//  MovieReview
//
//  Created by KangMingyo on 2023/05/25.
//

import UIKit

class MovieSearchViewModel {
    
    private let networkManager: NetworkManager
    var userGuideDescription: Observable<String?> = Observable("Welcome")
    var searchData = [MovieList]()
    
    init(networkManager: NetworkManager) {
        self.networkManager = networkManager
    }
    
    func getSearchDatas(title: String, completion: @escaping () -> Void) {
        let url = BaseURL.kobis.rawValue + URLPath.searchMovieURL.rawValue + title.urlEncoding()
        searchData = [MovieList]()
        networkManager.fetchData(for: url, dataType: SearchData.self) { [weak self] result in
            switch result {
            case .success(let data):
                self?.searchData.append(contentsOf: data.movieListResult.movieList)
                completion()
            case .failure(_):
                self?.setUserGuide(to: "오류가 발생했습니다. 다시 시도해주세요")
            }
        }
    }
    
    private func setUserGuide(to description: String?) {
        userGuideDescription.value = description
    }
}

