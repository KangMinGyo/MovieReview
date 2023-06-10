//
//  APIConfiguration.swift
//  MovieReview
//
//  Created by KangMingyo on 2023/06/07.
//

import Foundation

enum BaseURL: String {
    case kobis = "https://kobis.or.kr/kobisopenapi/webservice/rest"
    case tmdb = "https://api.themoviedb.org"
    case poster = "https://image.tmdb.org/t/p/original"
}

enum URLPath: String {
    case searchMovieURL = "/movie/searchMovieList.json?key=60c9b995596ead85ff6e59a8d3725e72&movieNm="
    case searchPosterURL = "/3/search/movie?api_key=ab318418ee513b352deb4c9ab21f7ed7&language=ko&page=1&include_adult=false&region=KR&query="
    case boxOfficeURL = "/boxoffice/searchDailyBoxOfficeList.json?key=60c9b995596ead85ff6e59a8d3725e72&targetDt="
}

enum APIKey: String {
    case kobisKey = "60c9b995596ead85ff6e59a8d3725e72"
    case tmdbKey = "ab318418ee513b352deb4c9ab21f7ed7"
}
