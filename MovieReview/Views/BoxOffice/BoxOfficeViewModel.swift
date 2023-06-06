//
//  BoxOfficeViewModel.swift
//  MovieReview
//
//  Created by KangMingyo on 2023/06/05.
//

import Foundation

class BoxOfficeViewModel {
    private let networkManager: NetworkManager
    var userGuideDescription: Observable<String?> = Observable("Welcome")
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
                self?.setUserGuide(to: "\(data.boxOfficeResult.dailyBoxOfficeList.first?.movieNm ?? "")")
                self?.boxOfficeData.append(contentsOf: data.boxOfficeResult.dailyBoxOfficeList)
                completion()
            case .failure(_):
                self?.setUserGuide(to: "오류가 발생했습니다. 다시 시도해주세요")
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
            case .failure(_):
                self?.setUserGuide(to: "포스터 불러오는데 오류가 발생했습니다. 다시 시도해주세요")
            }
        }
    }
    
    private func setUserGuide(to description: String?) {
        userGuideDescription.value = description
    }
    
    // 누적 관객 수 만 단위로 변경
    func audiAccCal(_ audiAcc: String) -> String {
        if 10000 <= Int(audiAcc) ?? 0 {
            let audiAccNum = (Int(audiAcc) ?? 0) / 10000
            return "\(audiAccNum)만"
        } else {
            return audiAcc
        }
    }
    
    // 전일 대비 증감 계산
    func rankIntenCal(_ rankInten: String) -> String {
        if rankInten == "0" {
            return "-"
        } else if 0 < Int(rankInten) ?? 0 {
            return "🔺\(rankInten)"
        } else {
            return "🔻\(abs(Int(rankInten) ?? 0))"
        }
    }
}
