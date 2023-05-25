//
//  SearchData.swift
//  MovieReview
//
//  Created by KangMingyo on 2023/05/24.
//

import Foundation

struct SearchData: Decodable {
    let movieListResult : MovieListResult
}

struct MovieListResult : Decodable {
    let movieList : [MovieList]
}

struct MovieList : Decodable {
    let movieNm, movieNmEn: String
    let prdtYear, nationAlt, genreAlt: String
    let directors: [directors]
    
    var movieInfo: String {
        return String(nationAlt + " | " + genreAlt + " | " + prdtYear)
    }
}

struct directors : Decodable {
    let peopleNm: String
}
