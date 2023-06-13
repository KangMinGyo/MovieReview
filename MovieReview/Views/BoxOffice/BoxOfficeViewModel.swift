//
//  BoxOfficeViewModel.swift
//  MovieReview
//
//  Created by KangMingyo on 2023/06/05.
//

import Foundation

class BoxOfficeViewModel {
    private let repository = Repository(networkManager: NetworkManager())
    
    var boxOfficeData = [DailyBoxOfficeList]()
    var posterData = [Results]()
    var posterUrl = [String]()

    func getBoxOfficeDatas(date: String, completion: @escaping () -> Void) {
        repository.fetchBoxOffice(date: date) { result in
            switch result {
            case .success(let data):
                self.boxOfficeData.append(contentsOf: data.boxOfficeResult.dailyBoxOfficeList)
                completion()
            case .failure(let err):
                print(err)
            }
        }
    }
    
    func getMoviePoster(title: String, completion: @escaping () -> Void) {
        repository.fetchMoviePoster(title: title) { result in
            switch result {
            case .success(let data):
                self.posterData.append(contentsOf: data.results)
                completion()
            case .failure(let err):
                print(err)
            }
        }
    }
    
    func getBoxOfficeMoviePoster() {
        for i in 0..<boxOfficeData.count {
            let name = boxOfficeData[i].movieNm
            getMoviePoster(title: name) { [self] in
                posterUrl.append(posterData.first?.posterPath ?? "")
                posterData = [Results]()
            }
        }
    }
}
