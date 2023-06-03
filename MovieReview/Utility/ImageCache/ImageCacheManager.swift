//
//  ImageCacheManager.swift
//  MovieReview
//
//  Created by KangMingyo on 2023/06/03.
//

import UIKit

class ImageCacheManager {
    static let shared = NSCache<NSString, UIImage>()
    private init() {}
}
