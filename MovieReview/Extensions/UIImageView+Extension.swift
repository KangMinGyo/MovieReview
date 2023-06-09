//
//  UIImageView+Extension.swift
//  MovieReview
//
//  Created by KangMingyo on 2023/06/03.
//

import UIKit

extension UIImageView {
    func setImageUrl(_ url: String) {
        
        // Cache에 사용될 Key값
        let cacheKey = NSString(string: url)
        
        if let cachedImage = ImageCacheManager.shared.object(forKey: cacheKey) {
            self.image = cachedImage
            return
        }
        
        DispatchQueue.global(qos: .background).async {
            if let imageUrl = URL(string: url) {
                URLSession.shared.dataTask(with: imageUrl) { (data, res, err) in
                    if let _ = err {
                        DispatchQueue.main.async {
                            self.image = UIImage()
                        }
                        return
                    }
                    DispatchQueue.main.async {
                        if let data = data, let image = UIImage(data: data) {
                            ImageCacheManager.shared.setObject(image, forKey: cacheKey) // 다운로드 된 이미지를 캐시에 저장
                            self.image = image
                        }
                    }
                }.resume()
            }
        }
    }
}
