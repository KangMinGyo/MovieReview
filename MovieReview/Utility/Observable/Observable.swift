//
//  Observable.swift
//  MovieReview
//
//  Created by KangMingyo on 2023/05/30.
//

import Foundation

class Observable<T> {
    var value: T {
        didSet {
            self.listener?(value)
        }
    }

    var listener: ((T) -> Void)?

    init(_ value: T) {
        self.value = value
    }

    func subscribe(listener: @escaping (T) -> Void) {
        listener(value)
        self.listener = listener
    }
}
