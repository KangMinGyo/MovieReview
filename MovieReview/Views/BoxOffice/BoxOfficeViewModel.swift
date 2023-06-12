//
//  BoxOfficeViewModel.swift
//  MovieReview
//
//  Created by KangMingyo on 2023/06/05.
//

import Foundation

class BoxOfficeViewModel {
    private let networkManager: NetworkManager
    
    var boxOfficeData = [DailyBoxOfficeList]()
    var posterData = [Results]()
    var posterUrl = [String]()

    init(networkManager: NetworkManager) {
        self.networkManager = networkManager
    }
    
    func getBoxOfficeDatas(date: String, completion: @escaping () -> Void) {
        let url = BaseURL.kobis.rawValue + URLPath.boxOfficeURL.rawValue + date
        
        networkManager.fetchData(for: url,
                                 dataType: BoxOffice.self) { [weak self] result in
            switch result {
            case .success(let data):
                self?.boxOfficeData.append(contentsOf: data.boxOfficeResult.dailyBoxOfficeList)
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

    func getMoviePoster(title: String, completion: @escaping () -> Void) {
        var url = BaseURL.tmdb.rawValue + URLPath.searchPosterURL.rawValue + title
        url = url.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        posterData = [Results]()
        networkManager.fetchData(for: url, dataType: SearchPoster.self) { [weak self] result in
            switch result {
            case .success(let data):
                self?.posterData.append(contentsOf: data.results)
                completion()
            case .failure(let err):
                print(err)
            }
        }
    }
}
