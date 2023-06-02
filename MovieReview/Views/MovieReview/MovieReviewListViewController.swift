//
//  ViewController.swift
//  MovieReview
//
//  Created by KangMingyo on 2023/05/13.
//

import UIKit

class MovieReviewListViewController: UIViewController {
    
    var viewModel = MovieReviewListViewModel()
    
    //MARK: - Properties
    
    private let collectionView: UICollectionView = {
        let flowlayout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowlayout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()

    lazy var movieSearchButton: UIBarButtonItem = {
        let button = UIBarButtonItem(image: UIImage(systemName: "pencil"),
                                     style: .plain,
                                     target: self,
                                     action: #selector(movieSearchButtonPressed))
        button.tintColor = .gray
        return button
    }()
    
    @objc func movieSearchButtonPressed() {
        let nextVC = MovieSearchView()
        self.show(nextVC, sender: self)
    }
    
    //MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "리뷰 목록"
        navigationItem.rightBarButtonItem = movieSearchButton
        configureCollectionView()
        configureComponent()
        
        viewModel.fetchReview()
    }
    
    //MARK: - Configure
    
    func configureCollectionView() {        
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(MovieReviewCollectionViewCell.self, forCellWithReuseIdentifier: MovieReviewCollectionViewCell.identifier)
    }
    
    func configureComponent() {
        view.addSubview(collectionView)

        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

extension MovieReviewListViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.review.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MovieReviewCollectionViewCell.identifier, for: indexPath) as! MovieReviewCollectionViewCell
        let review = viewModel.review[indexPath.row]
        cell.movieNameLabel.text = review.movieName
        cell.directorNameLabel.text = review.movieDirector
        cell.movieInfoLabel.text = review.movieInfo
        cell.dateLabel.text = review.reviewDate
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let nextVC = MovieReviewDetailViewController()
        nextVC.viewModel.movieData = viewModel.review[indexPath.row]
        self.show(nextVC, sender: self)
    }
}

extension MovieReviewListViewController: UICollectionViewDelegate {
    
}

extension MovieReviewListViewController: UICollectionViewDelegateFlowLayout {
    //Cell의 크기
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width - 20, height: view.frame.width / 2.5)
    }
    
    //Cell간의 간격
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    //상하좌우 공백
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
    }
}
