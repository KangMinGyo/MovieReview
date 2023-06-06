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
