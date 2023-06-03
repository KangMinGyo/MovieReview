//
//  MovieReviewListViewModel.swift
//  MovieReview
//
//  Created by KangMingyo on 2023/06/02.
//

import Foundation
import RealmSwift

class MovieReviewListViewModel {
    
    var review = [Review]()
    
    func fetchReview() {
        review = [Review]()
        
        let realm = try! Realm()
        review.append(contentsOf: realm.objects(Review.self))
//        print(review.count)
//        print(review)
    }
}
