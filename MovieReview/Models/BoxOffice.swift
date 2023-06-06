//
//  BoxOffice.swift
//  MovieReview
//
//  Created by KangMingyo on 2023/06/05.
//

import Foundation

struct BoxOffice: Codable {
    let boxOfficeResult : BoxOfficeResult
}

struct BoxOfficeResult: Codable {
    let dailyBoxOfficeList: [DailyBoxOfficeList]
}

struct DailyBoxOfficeList: Codable {
    let rank: String
    let rankInten: String
    let movieNm: String
    let openDt: String
    let audiAcc: String
    let movieCd: String
}
