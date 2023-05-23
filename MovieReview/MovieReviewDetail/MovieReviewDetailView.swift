//
//  MovieReviewDetailView.swift
//  MovieReview
//
//  Created by KangMingyo on 2023/05/21.
//

import UIKit

class MovieReviewDetailView: UIViewController {
    
    //MARK: - Properties
    
    private let movieNameLabel: UILabel = {
        let label = UILabel()
        label.text = "영화 제목"
        label.font = .systemFont(ofSize: 25)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let dateLabel: UILabel = {
        let label = UILabel()
        label.text = "작성일: 23.01.19 오후 5:23"
        label.textColor = .systemGray2
        label.font = .systemFont(ofSize: 15)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let posterImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "poster")
        imageView.layer.shadowColor = UIColor.black.cgColor
        imageView.layer.shadowRadius = 3.0
        imageView.layer.shadowOpacity = 1.0
        imageView.layer.shadowOffset = CGSize(width: 4, height: 4)
        imageView.layer.masksToBounds = false
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let myReviewLabel: UILabel = {
        let label = UILabel()
        label.text = "내 관람평"
        label.font = .systemFont(ofSize: 15, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let reviewView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray6
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let likeUnlikeLabel: UILabel = {
        let label = UILabel()
        label.text = "❤️ 좋았어요"
        label.font = .systemFont(ofSize: 15, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let reviewTextView: UITextView = {
        let textView = UITextView()
        textView.text = "이 영화는 GOAT입니다."
        textView.font = .systemFont(ofSize: 15)
        textView.backgroundColor = .systemGray6
        textView.isScrollEnabled = false
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    
    private let tagLabel: UILabel = {
        let label = UILabel()
        label.text = "#연기 #OST"
        label.textColor = .gray
        label.font = .systemFont(ofSize: 13)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = .systemBackground
        
        configureComponent()
    }
    
    //MARK: - Configure
    
    func configureComponent() {
        view.addSubview(movieNameLabel)
        view.addSubview(dateLabel)
        view.addSubview(posterImageView)
        view.addSubview(myReviewLabel)
        view.addSubview(reviewView)
        
        reviewView.addSubview(likeUnlikeLabel)
        reviewView.addSubview(reviewTextView)
        reviewView.addSubview(tagLabel)
        
        NSLayoutConstraint.activate([
            movieNameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            movieNameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            dateLabel.topAnchor.constraint(equalTo: movieNameLabel.bottomAnchor, constant: 10),
            dateLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            posterImageView.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 10),
            posterImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            posterImageView.widthAnchor.constraint(equalToConstant: 150),
            posterImageView.heightAnchor.constraint(equalToConstant: 230),
            
            myReviewLabel.topAnchor.constraint(equalTo: posterImageView.bottomAnchor, constant: 20),
            myReviewLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            reviewView.topAnchor.constraint(equalTo: myReviewLabel.bottomAnchor, constant: 5),
            reviewView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            reviewView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            reviewView.heightAnchor.constraint(equalToConstant: 200),
            
            likeUnlikeLabel.topAnchor.constraint(equalTo: reviewView.topAnchor, constant: 10),
            likeUnlikeLabel.leadingAnchor.constraint(equalTo: reviewView.leadingAnchor, constant: 10),
            
            reviewTextView.topAnchor.constraint(equalTo: likeUnlikeLabel.bottomAnchor, constant: 5),
            reviewTextView.leadingAnchor.constraint(equalTo: reviewView.leadingAnchor, constant: 10),
            reviewTextView.heightAnchor.constraint(equalToConstant: 140),
            
            tagLabel.topAnchor.constraint(equalTo: reviewTextView.bottomAnchor),
            tagLabel.leadingAnchor.constraint(equalTo: reviewView.leadingAnchor, constant: 10)
        ])
    }
}
