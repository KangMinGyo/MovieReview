//
//  ReviewWriteViewModel.swift
//  MovieReview
//
//  Created by KangMingyo on 2023/05/30.
//

import Foundation
import RealmSwift

class ReviewWriteViewModel {
    
    private let repository = Repository(networkManager: NetworkManager())
    var userGuideDescription: Observable<String?> = Observable("Welcome")
    
    var searchData: MovieList?
    var posterData = [Results]()
    var likeHateValue: String?
    var goodPointValue: [Bool]?
    var reviewText: String?
    
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
        realmData.imageURL = posterData.first?.posterPath ?? "URL 없음"
        realmData.movieName = searchData?.movieNm ?? "이름 없음"
        realmData.movieDirector = searchData?.directors.first?.peopleNm ?? "데이터 없음"
        realmData.movieInfo = searchData?.movieInfo ?? "정보 없음"
        realmData.reviewDate = dateString ?? "날짜 없음"
        realmData.reviewLikeHate = likeHateValue ?? ""
        realmData.reviewText = reviewText ?? ""
        realmData.reviewTag.append(objectsIn: goodPointValue ?? [])

        let realm = try! Realm()
        try! realm.write {
            realm.add(realmData)
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
    
    private func setUserGuide(to description: String?) {
        userGuideDescription.value = description
    }
}
