//
//  ReviewEditViewModel.swift
//  MovieReview
//
//  Created by KangMingyo on 2023/06/17.
//

import Foundation
import RealmSwift

class ReviewUpdateViewModel {
    
    var index: Int?
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
        let realm = try! Realm()
        if let index = index {
            let updateData = realm.objects(Review.self)[index]
            try! realm.write {
                updateData.reviewLikeHate = likeHateValue ?? ""
                updateData.reviewText = reviewText ?? ""
                updateData.reviewTag.removeAll()
                updateData.reviewTag.append(objectsIn: goodPointValue ?? [])
            }
        }
    }
}
