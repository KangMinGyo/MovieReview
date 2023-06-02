//
//  ReviewWriteViewModel.swift
//  MovieReview
//
//  Created by KangMingyo on 2023/05/30.
//

import Foundation
import RealmSwift

class ReviewWriteViewModel {
    
    var searchData: MovieList?
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
        realmData.movieName = searchData?.movieNm ?? "이름 없음"
        realmData.movieDirector = searchData?.directors.first?.peopleNm ?? "데이터 없음"
        realmData.movieInfo = searchData?.movieInfo ?? "정보 없음"
        realmData.reviewDate = dateString ?? "날짜 없음"
        realmData.reviewLikeHate = likeHateValue ?? ""
        realmData.reviewText = reviewText ?? ""
        realmData.reviewTag.append(objectsIn: goodPointValue ?? [])
        
        print(realmData)

//        // Realm 파일 위치
        print(Realm.Configuration.defaultConfiguration.fileURL!)
//
        let realm = try! Realm()
        try! realm.write {
            realm.add(realmData)
        }
//
        //삭제
//        let realm = try! Realm()
//        try! realm.write {
//            realm.delete(realm.objects(Review.self))
//        }
    }
}

