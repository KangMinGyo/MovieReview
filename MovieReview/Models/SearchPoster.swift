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
    let posterPath : String
    
    enum CodingKeys: String, CodingKey {
        case posterPath = "poster_path"
    }
}

