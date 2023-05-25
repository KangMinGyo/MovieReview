//
//  NetworkMockTests.swift
//  NetworkMockTests
//
//  Created by KangMingyo on 2023/05/25.
//

import XCTest
@testable import MovieReview

final class NetworkMockTests: XCTestCase {

    var url: String!
    var data: Data!
    
    override func setUpWithError() throws {
        url = "https://kobis.or.kr/kobisopenapi/webservice/rest/movie/searchMovieList.json?key=60c9b995596ead85ff6e59a8d3725e72&movieNm=범죄도시"
        url = url.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        data = JsonLoader.data(fileName: "SearchData")
    }
    
    override func tearDownWithError() throws {
        url = nil
        data = nil
    }
    
    func test_fetchData_Data가_있고_statusCode가_200일때() {
        // given
        let mockURLSession = MockURLSession.make(url: url,
                                                 data: data,
                                                 statusCode: 200)
        let sut = NetworkManager(session: mockURLSession)
        
        // when
        var result: SearchData?
        sut.fetchData(for: url,
                      dataType: SearchData.self) { response in
            if case let .success(data) = response {
                result = data
            }
        }
        
        // then
        let expectation: SearchData? = JsonLoader.load(type: SearchData.self, fileName: "SearchData")
        XCTAssertEqual(result?.movieListResult.movieList.count, expectation?.movieListResult.movieList.count)
        XCTAssertEqual(result?.movieListResult.movieList.first?.movieNm, expectation?.movieListResult.movieList.first?.movieNm)
    }
    
//    func test_fetchData_Data에_대한_잘못된_dataType을_넘겼을때() {
//        // given
//        let mockURLSession = MockURLSession.make(url: url,
//                                                 data: data,
//                                                 statusCode: 200)
//        let sut = NetworkManager(session: mockURLSession)
//        
//        
//        // when
//        var result: NetworkError?
//        sut.fetchData(for: url,
//                      dataType: SearchData.self) { response in
//            if case let .failure(error) = response {
//                result = error as? NetworkError
//            }
//        }
//        
//        // then
//        let expectation: NetworkError = NetworkError.failToParse
//        XCTAssertEqual(result, expectation)
//    }
    
    func test_fetchData_Data가_없고_statusCode가_500일때() {
        // given
        let mockURLSession = MockURLSession.make(url: url,
                                                 data: nil,
                                                 statusCode: 500)
        let sut = NetworkManager(session: mockURLSession)
        
        // when
        var result: Error?
        sut.fetchData(for: url,
                      dataType: SearchData.self) { response in
            if case let .failure(error) = response {
                result = error
            }
        }
        
        // then
        XCTAssertNotNil(result)
    }

}
