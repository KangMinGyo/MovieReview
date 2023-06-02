//
//  Review.swift
//  MovieReview
//
//  Created by KangMingyo on 2023/05/24.
//

import Foundation
import RealmSwift

class Review: Object {
    @objc dynamic var movieName: String = ""
    @objc dynamic var movieDirector: String = ""
    @objc dynamic var movieInfo: String = ""
    @objc dynamic var reviewDate: String = ""
    @objc dynamic var reviewLikeHate: String = ""
    @objc dynamic var reviewText: String = ""
    let reviewTag = List<Bool>()
}
