//
//  ReviewWriteViewModel.swift
//  MovieReview
//
//  Created by KangMingyo on 2023/05/30.
//

import Foundation
import RealmSwift

class ReviewWriteViewModel {
    
    private let networkManager: NetworkManager
    var userGuideDescription: Observable<String?> = Observable("Welcome")
    
    var searchData: MovieList?
    var posterData = [Results]()
    var likeHateValue: String?
    var goodPointValue: [Bool]?
    var reviewText: String?

    init(networkManager: NetworkManager) {
        self.networkManager = networkManager
    }
    
    var dateString: String? {
        let date =  Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "작성일: yy.MM.dd a hh:mm"
        dateFormatter.locale = Locale(identifier:"ko_KR")
        let dateString = dateFormatter.string(from: date)
        return dateString
    }
    
    func setRealmData() {
        let realmData = Review()
        realmData.imageURL = posterData.first?.poster_path ?? "URL 없음"
        realmData.movieName = searchData?.movieNm ?? "이름 없음"
        realmData.movieDirector = searchData?.directors.first?.peopleNm ?? "데이터 없음"
        realmData.movieInfo = searchData?.movieInfo ?? "정보 없음"
        realmData.reviewDate = dateString ?? "날짜 없음"
        realmData.reviewLikeHate = likeHateValue ?? ""
        realmData.reviewText = reviewText ?? ""
        realmData.reviewTag.append(objectsIn: goodPointValue ?? [])

//        print(realmData)
        let realm = try! Realm()
        try! realm.write {
            realm.add(realmData)
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
                print(self?.posterData)
                completion()
            case .failure(_):
                self?.setUserGuide(to: "포스터 불러오는데 오류가 발생했습니다. 다시 시도해주세요")
            }
        }
    }
    
    private func setUserGuide(to description: String?) {
        userGuideDescription.value = description
    }
}
