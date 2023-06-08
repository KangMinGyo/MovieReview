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
    
    var movieName = [String]()
    var posterUrl = [String]()

    init(networkManager: NetworkManager) {
        self.networkManager = networkManager
    }
    
    func getBoxOfficeDatas(date: String, completion: @escaping () -> Void) {
        let url = BaseURL.kobis.rawValue + URLPath.boxOffce.rawValue + date
        boxOfficeData = [DailyBoxOfficeList]()
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
            movieName.append(boxOfficeData[i].movieNm)
        }
        
        for name in movieName {
            getMoviePoster(title: name) { [self] in
                print(name)
                if posterData.first?.poster_path == nil {
                    posterUrl.append(BaseURL.poster.rawValue)
                    print("\(posterUrl), \(name)")
                } else {
                    posterUrl.append(posterData.first?.poster_path ?? "")
                    print("\(posterUrl), \(name)")
                }
                posterData = [Results]()
            }
        }
    }
    
    func getMoviePoster(title: String, completion: @escaping () -> Void) {
        var url = BaseURL.tmdb.rawValue + URLPath.searchPoster.rawValue + title
        url = url.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        posterData = [Results]()
        networkManager.fetchData(for: url, dataType: SearchPoster.self) { [weak self] result in
            switch result {
            case .success(let data):
                self?.posterData.append(contentsOf: data.results)
//                print(self?.posterData)
                completion()
            case .failure(let err):
                print(err)
            }
        }
    }
}
