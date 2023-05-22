//
//  ReviewWriteView.swift
//  MovieReview
//
//  Created by KangMingyo on 2023/05/22.
//

import UIKit

class ReviewWriteView: UIViewController {
    
    let imageSize = CGSize(width: 50, height: 50)
    
    //MARK: - Properties
    
    private let howLabel: UILabel = {
        let label = UILabel()
        label.text = "이 영화는 어땠나요?"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    lazy var likeButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 50))
        button.backgroundColor = .systemGray6
        button.setTitleColor(.black, for: .normal)
        button.setTitle("❤️ 좋았어요", for: .normal)
        button.addTarget(self, action: #selector(likeButtonAction), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    lazy var hateButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 50))
        button.backgroundColor = .systemGray6
        button.setTitleColor(.black, for: .normal)
        button.setTitle("💔 별로였어요", for: .normal)
        button.addTarget(self, action: #selector(hateButtonAction), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private let likeHateButtonStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 20
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let goodPointSelectView : GoodPointSelectView = {
        let view = GoodPointSelectView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "리뷰 작성"
        view.backgroundColor = .systemBackground
        
        addSubView()
    }
    

    //MARK: - Configure
    
    func addSubView() {
        view.addSubview(howLabel)
        view.addSubview(likeHateButtonStackView)
        view.addSubview(goodPointSelectView)
//        view.addSubview(myReviewLabel)
//        view.addSubview(reviewTextView)

        configureStackView()
        configureComponent()
    }
    
    func configureComponent() {
        NSLayoutConstraint.activate([
            howLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            howLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            howLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),

            likeHateButtonStackView.topAnchor.constraint(equalTo: howLabel.bottomAnchor, constant: 10),
            likeHateButtonStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            likeHateButtonStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            goodPointSelectView.topAnchor.constraint(equalTo: likeHateButtonStackView.bottomAnchor, constant: 40),
            goodPointSelectView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            goodPointSelectView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
//
//            myReviewLabel.topAnchor.constraint(equalTo: goodPointSelectView.bottomAnchor, constant: 20),
//            myReviewLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
//            myReviewLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
//
//            reviewTextView.topAnchor.constraint(equalTo: myReviewLabel.bottomAnchor, constant: 20),
//            reviewTextView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
//            reviewTextView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
//            reviewTextView.heightAnchor.constraint(equalToConstant: 200)
        ])
    }
    
    func configureStackView() {
        [likeButton, hateButton].forEach {
            self.likeHateButtonStackView.addArrangedSubview($0)
        }
    }
    
    @objc func likeButtonAction() {
        print("Like Button tapped")
    }
    
    @objc func hateButtonAction() {
        print("hate Button tapped")
    }
}
