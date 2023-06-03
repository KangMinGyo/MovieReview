//
//  ReviewWriteView.swift
//  MovieReview
//
//  Created by KangMingyo on 2023/05/22.
//

import UIKit

class ReviewWriteViewController: UIViewController {
    
    var viewModel = ReviewWriteViewModel(networkManager: NetworkManager())
    
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
    
    lazy var registerButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(named: "mrRed")
        button.setTitleColor(.white, for: .normal)
        button.setTitle("등록", for: .normal)
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(registerButtonAction), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    @objc func registerButtonAction() {
        viewModel.likeHateValue = likeHateSelectView.likeHateValue
        viewModel.goodPointValue = goodPointSelectView.goodPointSelected
        viewModel.reviewText = reviewWritingView.reviewTextView.text
        viewModel.setRealmData()
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    let totalView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = viewModel.searchData?.movieNm
        reviewWritingView.reviewTextView.delegate = self
        view.backgroundColor = .systemBackground
        
        addSubView()
        fetchPoster()
        
        self.hideKeyboard()
    }
    
    func fetchPoster() {
        viewModel.getMoviePoster(title: viewModel.searchData!.movieNm) {
            print("완")
        }
    }

    //MARK: - Configure
    
    func addSubView() {
        view.addSubview(scrollView)
        
        scrollView.addSubview(totalView)
        
        totalView.addSubview(likeHateSelectView)
        totalView.addSubview(goodPointSelectView)
        totalView.addSubview(reviewWritingView)
        totalView.addSubview(registerButton)
        
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
            
            registerButton.topAnchor.constraint(equalTo: reviewWritingView.bottomAnchor, constant: 20),
            registerButton.leadingAnchor.constraint(equalTo: totalView.leadingAnchor),
            registerButton.trailingAnchor.constraint(equalTo: totalView.trailingAnchor),
            registerButton.bottomAnchor.constraint(equalTo: totalView.bottomAnchor, constant: -300),
        ])
    }
}

extension ReviewWriteViewController: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        if reviewWritingView.reviewTextView.textColor == UIColor.lightGray {
            reviewWritingView.reviewTextView.text = ""
            reviewWritingView.reviewTextView.textColor = UIColor.systemGray
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if reviewWritingView.reviewTextView.text.isEmpty {
            reviewWritingView.reviewTextView.text = "내용을 입력해주세요."
            reviewWritingView.reviewTextView.textColor = UIColor.lightGray
        }
    }
}

extension UIViewController {
    func hideKeyboard() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self,
            action: #selector(UIViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
