//
//  ReviewWritingView.swift
//  MovieReview
//
//  Created by KangMingyo on 2023/05/23.
//

import UIKit

class ReviewWritingView: UIView {
    
    //MARK: - Properties
    
    private let myReviewLabel: UILabel = {
        let label = UILabel()
        label.text = "나의 관람평"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let reviewTextView: UITextView = {
        let textView = UITextView()
        textView.text = "관람평을 작성해주세요."
        textView.font = .systemFont(ofSize: 15)
        textView.backgroundColor = .systemGray6
        textView.isScrollEnabled = false
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()

    //MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubView()
    }
    
    required init?(coder NSCoder : NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    //MARK: - Configure
    
    func addSubView() {
        self.addSubview(myReviewLabel)
        self.addSubview(reviewTextView)

        configureComponent()
    }
    
    func configureComponent() {
        NSLayoutConstraint.activate([
            myReviewLabel.topAnchor.constraint(equalTo: topAnchor),
            myReviewLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            myReviewLabel.trailingAnchor.constraint(equalTo: trailingAnchor),

            reviewTextView.topAnchor.constraint(equalTo: myReviewLabel.bottomAnchor, constant: 10),
            reviewTextView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            reviewTextView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            reviewTextView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            reviewTextView.heightAnchor.constraint(equalToConstant: 200)
//
//            registerButton.topAnchor.constraint(equalTo: reviewTextView.bottomAnchor, constant: 20),
//            registerButton.leadingAnchor.constraint(equalTo: self.leadingAnchor),
//            registerButton.trailingAnchor.constraint(equalTo: self.trailingAnchor),
//            registerButton.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }

}
