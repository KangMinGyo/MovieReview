//
//  MovieReviewDetailViewModel.swift
//  MovieReview
//
//  Created by KangMingyo on 2023/06/02.
//

import Foundation

class MovieReviewDetailViewModel {
    var movieData = Review()
    let tag = ["연기", "연출", "OST", "스토리", "영상미"]
    var goodPointValue = String()
    
    
    func likeHate() -> String {
        if movieData.reviewLikeHate == "Like" {
            return "❤️좋았어요"
        } else {
            return "💔별로였어요"
        }
    }
    
    func goodPoint() -> String {
        for i in 0..<5 {
            if movieData.reviewTag[i] == true {
                goodPointValue.append("#\(tag[i]) ")
            }
        }
        return goodPointValue
    }
}

//List<bool> <0x600003ff82c0> (
//    [0] 0,
//    [1] 1,
//    [2] 0,
//    [3] 1,
//    [4] 0
//)
