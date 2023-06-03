//
//  SearchPoster.swift
//  MovieReview
//
//  Created by KangMingyo on 2023/06/03.
//

import Foundation

struct SearchPoster: Codable {
    let results : [Results]
}

struct Results: Codable {
    let poster_path : String?
}
