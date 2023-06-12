//
//  String+Extension.swift
//  MovieReview
//
//  Created by KangMingyo on 2023/06/10.
//

import Foundation

extension String {
    func urlEncoding() -> String {
        return self.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
    }
}
