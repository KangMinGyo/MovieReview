//
//  ReviewWriteView.swift
//  MovieReview
//
//  Created by KangMingyo on 2023/05/22.
//

import UIKit

class ReviewWriteViewController: UIViewController {
    
    //MARK: - Properties
    
    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private let likeHateSelectView : LikeHateSelectView = {
        let view = LikeHateSelectView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let goodPointSelectView : GoodPointSelectView = {
        let view = GoodPointSelectView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let reviewWritingView : ReviewWritingView = {
        let view = ReviewWritingView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let totalView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
//
//    private let myReviewLabel: UILabel = {
//        let label = UILabel()
//        label.text = "나의 관람평"
//        label.translatesAutoresizingMaskIntoConstraints = false
//        return label
//    }()
//
//    private let reviewTextView: UITextView = {
//        let textView = UITextView()
//        textView.text = "관람평을 작성해주세요."
//        textView.font = .systemFont(ofSize: 15)
//        textView.backgroundColor = .systemGray6
//        textView.isScrollEnabled = false
//        textView.translatesAutoresizingMaskIntoConstraints = false
//        return textView
//    }()
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "리뷰 작성"
        view.backgroundColor = .systemBackground
        
        addSubView()
    }

    //MARK: - Configure
    
    func addSubView() {
        view.addSubview(scrollView)
        
        scrollView.addSubview(totalView)
        
        totalView.addSubview(likeHateSelectView)
        totalView.addSubview(goodPointSelectView)
        totalView.addSubview(reviewWritingView)
//        totalView.addSubview(myReviewLabel)
//        totalView.addSubview(reviewTextView)
        
        configureComponent()
    }
    
    func configureComponent() {
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            totalView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            totalView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            totalView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            
            likeHateSelectView.topAnchor.constraint(equalTo: totalView.topAnchor, constant: 20),
            likeHateSelectView.leadingAnchor.constraint(equalTo: totalView.leadingAnchor),
            likeHateSelectView.trailingAnchor.constraint(equalTo: totalView.trailingAnchor),
            
            goodPointSelectView.topAnchor.constraint(equalTo: likeHateSelectView.bottomAnchor, constant: 40),
            goodPointSelectView.leadingAnchor.constraint(equalTo: totalView.leadingAnchor),
            goodPointSelectView.trailingAnchor.constraint(equalTo: totalView.trailingAnchor),
            
            reviewWritingView.topAnchor.constraint(equalTo: goodPointSelectView.bottomAnchor, constant: 40),
            reviewWritingView.leadingAnchor.constraint(equalTo: totalView.leadingAnchor),
            reviewWritingView.trailingAnchor.constraint(equalTo: totalView.trailingAnchor),
            reviewWritingView.bottomAnchor.constraint(equalTo: totalView.bottomAnchor, constant: -300),
            
//            myReviewLabel.topAnchor.constraint(equalTo: goodPointSelectView.bottomAnchor, constant: 40),
//            myReviewLabel.leadingAnchor.constraint(equalTo: totalView.leadingAnchor),
//            myReviewLabel.trailingAnchor.constraint(equalTo: totalView.trailingAnchor),
//
//            reviewTextView.topAnchor.constraint(equalTo: myReviewLabel.bottomAnchor, constant: 10),
//            reviewTextView.leadingAnchor.constraint(equalTo: totalView.leadingAnchor),
//            reviewTextView.trailingAnchor.constraint(equalTo: totalView.trailingAnchor),
//            reviewTextView.bottomAnchor.constraint(equalTo: totalView.bottomAnchor, constant: -300),
//            reviewTextView.heightAnchor.constraint(equalToConstant: 200)
        ])
    }
}
