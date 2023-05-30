//
//  MovieSearchViewModel.swift
//  MovieReview
//
//  Created by KangMingyo on 2023/05/25.
//

import UIKit

class Observable<T> {
    //1-1. 값 담을 value 만듦
    var value: T {
        //2. didSet 생성
        didSet {
            //4. 값이 변경 될 때마다 listener 에 담겨있는 행동 수행
            self.listener?(value)
        }
    }

    //3. 값이 변경 될 때마다 수행될 행동을 담고 있는 클로저 변수 생성
    var listener: ((T) -> Void)?

    //1-2. init 생성
    init(_ value: T) {
        self.value = value
    }

    //5. 구독을 통해 파라미터로 넘어온 '특정 행동'을 수행하고,  나중에 didSet 에서도 실행할 수 있도록 클로저 변수에 담기
    func subscribe(listener: @escaping (T) -> Void) {
        listener(value)
        self.listener = listener
    }
}

class MovieSearchViewModel {

    private let networkManager: NetworkManager
    var userGuideDescription: Observable<String?> = Observable("Welcome")
    var searchData = [MovieList]()

    init(networkManager: NetworkManager) {
        self.networkManager = networkManager
    }
    
    func getSearchDatas(title: String, completion: @escaping () -> Void) {
        var url = BaseURL.kobis.rawValue + URLPath.searchMovie.rawValue + title
        url = url.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        searchData = [MovieList]()
        networkManager.fetchData(for: url,
                                    dataType: SearchData.self) { [weak self] result in
            switch result {
            case .success(let data):
                self?.setUserGuide(to: "\(data.movieListResult.movieList.first?.movieNm ?? "")")
                self?.searchData.append(contentsOf: data.movieListResult.movieList)
                completion()
            case .failure(_):
                self?.setUserGuide(to: "오류가 발생했습니다. 다시 시도해주세요")
            }
        }
    }
    
    private func setUserGuide(to description: String?) {
        userGuideDescription.value = description
    }
}

