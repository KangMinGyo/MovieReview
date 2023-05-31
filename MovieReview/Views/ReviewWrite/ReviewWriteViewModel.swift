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
    
    func setRealmData() {
        let realmData = Review()
        realmData.movieName = searchData?.movieNm ?? "이름없음"
        realmData.movieDirector = searchData?.directors.first?.peopleNm ?? "데이터 없음"
        realmData.movieInfo = searchData?.movieInfo ?? "정보없음"
        realmData.reviewDate = "작성일: 23.05.30 오후 21:36"
        realmData.reviewLikeHate = "Like"
        realmData.reviewText = "너무 재밌어요!"
        realmData.reviewTag = "연기, OST"
        
        print(realmData)
//        // Realm 파일 위치
//        print(Realm.Configuration.defaultConfiguration.fileURL!)
        
//        let realm = try! Realm()
//        try! realm.write {
//            realm.add(realmData)
//        }
    }
}
