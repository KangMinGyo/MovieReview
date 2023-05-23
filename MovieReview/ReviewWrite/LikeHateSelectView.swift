//
//  LikeHateSelectView.swift
//  MovieReview
//
//  Created by KangMingyo on 2023/05/22.
//

import UIKit

class LikeHateSelectView: UIView {
    
    //MARK: - Properties
    
    private let howLabel: UILabel = {
        let label = UILabel()
        label.text = "이 영화는 어땠나요?"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    lazy var likeButton: UIButton = {
        let button = UIButton()
        button.tag = 0
        button.backgroundColor = .systemGray6
        button.setTitleColor(.black, for: .normal)
        button.setTitle("❤️ 좋았어요", for: .normal)
        button.layer.cornerRadius = 15
        button.layer.borderColor = UIColor.gray.cgColor
        button.layer.borderWidth = 1
        button.addTarget(self, action: #selector(LikeHateButtonAction), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    lazy var hateButton: UIButton = {
        let button = UIButton()
        button.tag = 1
        button.backgroundColor = .systemGray6
        button.setTitleColor(.black, for: .normal)
        button.setTitle("💔 별로였어요", for: .normal)
        button.layer.cornerRadius = 15
        button.layer.borderColor = UIColor.gray.cgColor
        button.layer.borderWidth = 1
        button.addTarget(self, action: #selector(LikeHateButtonAction), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    @objc func LikeHateButtonAction(sender: UIButton) {
        if sender.tag == 0 {
            likeButton.layer.borderColor = UIColor(named: "mrRed")?.cgColor
            hateButton.layer.borderColor = UIColor.gray.cgColor
            print(0)
        } else {
            likeButton.layer.borderColor = UIColor.gray.cgColor
            hateButton.layer.borderColor = UIColor(named: "mrRed")?.cgColor
            print(1)
        }
    }

    private let likeHateButtonStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 20
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
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
        self.addSubview(howLabel)
        self.addSubview(likeHateButtonStackView)

        configureStackView()
        configureComponent()
    }
    
    func configureComponent() {
        NSLayoutConstraint.activate([
            howLabel.topAnchor.constraint(equalTo: topAnchor),
            howLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            howLabel.trailingAnchor.constraint(equalTo: trailingAnchor),

            likeHateButtonStackView.topAnchor.constraint(equalTo: howLabel.bottomAnchor, constant: 10),
            likeHateButtonStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            likeHateButtonStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            likeHateButtonStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
    
    func configureStackView() {
        [likeButton, hateButton].forEach {
            self.likeHateButtonStackView.addArrangedSubview($0)
        }
    }
}
