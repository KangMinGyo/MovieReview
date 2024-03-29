//
//  PopUpViewModel.swift
//  MovieReview
//
//  Created by KangMingyo on 2023/06/16.
//

import Foundation
import RealmSwift

class PopUpViewModel {
    var movieData = Review()
    var index: Int?
    
    func deleteReview() {
        let realm = try! Realm()
        try! realm.write {
            realm.delete(movieData)
        }
    }
}
