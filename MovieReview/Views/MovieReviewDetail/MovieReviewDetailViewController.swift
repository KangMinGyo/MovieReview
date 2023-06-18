//
//  MovieReviewDetailView.swift
//  MovieReview
//
//  Created by KangMingyo on 2023/05/21.
//

import UIKit

class MovieReviewDetailViewController: UIViewController {
    
    let viewModel = MovieReviewDetailViewModel()
    var isDelete = false
    
    //MARK: - Properties
    
    private let movieNameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 25)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let dateLabel: UILabel = {
        let label = UILabel()
        label.textColor = .systemGray2
        label.font = .systemFont(ofSize: 15)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let posterImageView: UIImageView = {
        let imageView = UIImageView()
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
        label.font = .systemFont(ofSize: 15, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let editDeleteButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "trash.fill"), for: .normal)
        button.tintColor = .systemGray2
        button.addTarget(self, action: #selector(editDeleteButtonAction), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    @objc func editDeleteButtonAction() {
        let popUp = PopUpViewController()
        popUp.modalPresentationStyle = .overCurrentContext
        popUp.viewModel.movieData = viewModel.movieData
        popUp.viewModel.index = viewModel.index
        self.present(popUp, animated: true)
        self.isDelete = true
    }
    
    private let reviewTextView: UITextView = {
        let textView = UITextView()
        textView.font = .systemFont(ofSize: 15)
        textView.backgroundColor = .systemGray6
        textView.isScrollEnabled = false
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    
    private let tagLabel: UILabel = {
        let label = UILabel()
        label.textColor = .gray
        label.font = .systemFont(ofSize: 13)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(viewModel.movieData)
        view.backgroundColor = .systemBackground
        addSubView()
        configure()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        print(isDelete)
        if isDelete {
            self.navigationController?.popToRootViewController(animated: true)
        }
        self.isDelete = false
    }
    
    //MARK: - Configure
    
    func configure() {
        let url = BaseURL.poster.rawValue + viewModel.movieData.imageURL
        posterImageView.setImageUrl(url)
        movieNameLabel.text = viewModel.movieData.movieName
        dateLabel.text = viewModel.movieData.reviewDate
        likeUnlikeLabel.text = viewModel.likeHate()
        reviewTextView.text = viewModel.movieData.reviewText
        tagLabel.text = viewModel.goodPoint()
    }
    
    func addSubView() {
        view.addSubview(movieNameLabel)
        view.addSubview(dateLabel)
        view.addSubview(posterImageView)
        view.addSubview(myReviewLabel)
        view.addSubview(reviewView)
        
        reviewView.addSubview(likeUnlikeLabel)
        reviewView.addSubview(editDeleteButton)
        reviewView.addSubview(reviewTextView)
        reviewView.addSubview(tagLabel)
        
        configureComponent()
    }
    
    func configureComponent() {
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
            
            editDeleteButton.topAnchor.constraint(equalTo: reviewView.topAnchor, constant: 10),
            editDeleteButton.trailingAnchor.constraint(equalTo: reviewView.trailingAnchor, constant: -10),
            
            reviewTextView.topAnchor.constraint(equalTo: likeUnlikeLabel.bottomAnchor, constant: 5),
            reviewTextView.leadingAnchor.constraint(equalTo: reviewView.leadingAnchor, constant: 10),
            reviewTextView.heightAnchor.constraint(equalToConstant: 140),
            
            tagLabel.topAnchor.constraint(equalTo: reviewTextView.bottomAnchor),
            tagLabel.leadingAnchor.constraint(equalTo: reviewView.leadingAnchor, constant: 10)
        ])
    }
}
