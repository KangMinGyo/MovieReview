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
        url = "https://kobis.or.kr/kobisopenapi/webservice/rest/movie/searchMovieList.json?"
        data = JsonLoader.data(fileName: "SearchDatas")
    }

    override func tearDownWithError() throws {
        url = nil
        data = nil
    }

    func test_fetchData_Data가_있고_statusCode가_200일때_Title을_잘_가져오는가() {
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
        let expectation: SearchData? = JsonLoader.load(type: SearchData.self, fileName: "SearchDatas")
        XCTAssertEqual(result?.movieListResult.movieList.count, expectation?.movieListResult.movieList.count)
        XCTAssertEqual(result?.movieListResult.movieList.first?.movieNm, "범죄도시3")
    }

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
