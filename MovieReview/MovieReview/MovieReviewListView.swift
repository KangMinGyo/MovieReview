//
//  ViewController.swift
//  MovieReview
//
//  Created by KangMingyo on 2023/05/13.
//

import UIKit

class MovieReviewListView: UIViewController {
    
    //MARK: - Properties
    
    private let collectionView: UICollectionView = {
        let flowlayout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: flowlayout)
        return cv
    }()

    lazy var movieSearchButton: UIBarButtonItem = {
        let button = UIBarButtonItem(image: UIImage(systemName: "pencil"),
                                     style: .plain,
                                     target: self,
                                     action: #selector(movieSearchButtonPressed))
        button.tintColor = .gray
        return button
    }()
    
    //MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        title = "리뷰 목록"
        navigationItem.rightBarButtonItem = movieSearchButton
        
        configureCollectionView()
    }

    //MARK: - Configure
    
    func configureCollectionView() {        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        view.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        collectionView.register(MovieReviewCollectionViewCell.self, forCellWithReuseIdentifier: MovieReviewCollectionViewCell.identifier)
    }
    
    @objc func movieSearchButtonPressed() {
        let nextVC = MovieSearchView()
        self.show(nextVC, sender: self)
    }

}

extension MovieReviewListView: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MovieReviewCollectionViewCell.identifier, for: indexPath) as! MovieReviewCollectionViewCell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let nextVC = MovieReviewDetailView()
        self.show(nextVC, sender: self)
    }
}

extension MovieReviewListView: UICollectionViewDelegate {
    
}

extension MovieReviewListView: UICollectionViewDelegateFlowLayout {
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
