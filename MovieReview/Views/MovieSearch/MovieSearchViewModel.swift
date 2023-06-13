//
//  MovieSearchViewModel.swift
//  MovieReview
//
//  Created by KangMingyo on 2023/05/25.
//

import UIKit

class MovieSearchViewModel {
    
    private let repository = Repository(networkManager: NetworkManager())
    var userGuideDescription: Observable<String?> = Observable("Welcome")
    var searchData = [MovieList]()

    func getSearchDatas(title: String, completion: @escaping () -> Void) {
        repository.fetchSearchDatas(title: title) { result in
            switch result {
            case .success(let data):
                self.searchData.append(contentsOf: data.movieListResult.movieList)
                completion()
            case .failure(let err):
                print(err)
            }
        }
    }
    
    private func setUserGuide(to description: String?) {
        userGuideDescription.value = description
    }
}

