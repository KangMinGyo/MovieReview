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
    
    let totalView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
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
        self.addSubview(totalView)
        totalView.addSubview(myReviewLabel)
        totalView.addSubview(reviewTextView)

        configureComponent()
    }
    
    func configureComponent() {
        NSLayoutConstraint.activate([
            totalView.topAnchor.constraint(equalTo: topAnchor),
            totalView.leadingAnchor.constraint(equalTo: leadingAnchor),
            totalView.trailingAnchor.constraint(equalTo: trailingAnchor),
            totalView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            myReviewLabel.topAnchor.constraint(equalTo: totalView.topAnchor),
            myReviewLabel.leadingAnchor.constraint(equalTo: totalView.leadingAnchor),
            myReviewLabel.trailingAnchor.constraint(equalTo: totalView.trailingAnchor),

            reviewTextView.topAnchor.constraint(equalTo: myReviewLabel.bottomAnchor, constant: 10),
            reviewTextView.leadingAnchor.constraint(equalTo: totalView.leadingAnchor),
            reviewTextView.trailingAnchor.constraint(equalTo: totalView.trailingAnchor),
            reviewTextView.heightAnchor.constraint(equalToConstant: 200),
            reviewTextView.bottomAnchor.constraint(equalTo: totalView.bottomAnchor)
        ])
    }
}
