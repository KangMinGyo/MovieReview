//
//  SearchViewModelTests.swift
//  NetworkMockTests
//
//  Created by KangMingyo on 2023/05/27.
//

import XCTest
@testable import MovieReview

final class SearchViewModelTests: XCTestCase {
    
    var sut: MovieSearchViewModel!
    var url: String!
    var data: Data!
    var title: String!
    
    override func setUpWithError() throws {
        title = "범죄도시"
        url = BaseURL.kobis.rawValue + URLPath.searchMovie.rawValue + title
        url = url.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        data = JsonLoader.data(fileName: "SearchDatas")
    }
    
    override func tearDownWithError() throws {
        sut = nil
        url = nil
        data = nil
    }

    func test_getSearchDatas() {
        // given
        let mockURLSession: MockURLSession = MockURLSession.make(url: url,
                                                                 data: data,
                                                                 statusCode: 200)
        
        // when
        sut = MovieSearchViewModel(networkManager: NetworkManager(session: mockURLSession))
        sut.getSearchDatas(title: "범죄도시")
        
        // then
        let expectation = "범죄도시3"
        XCTAssertEqual(sut.userGuideDescription.value, expectation)
    }
}
