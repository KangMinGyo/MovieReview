//
//  MovieReviewCollectionViewCell.swift
//  MovieReview
//
//  Created by KangMingyo on 2023/05/13.
//

import UIKit

class MovieReviewCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "ReviewCell"
    
    private let posterImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "heart")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let movieNameLabel: UILabel = {
        let label = UILabel()
        label.text = "영화 제목"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let directorNameLabel: UILabel = {
        let label = UILabel()
        label.text = "영화 감독"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let movieInfoLabel: UILabel = {
        let label = UILabel()
        label.text = "미국 | 미스터리, 범죄 | 2000"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let dateLabel: UILabel = {
        let label = UILabel()
        label.text = "작성일: 23.01.19 오후 5:23"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .systemMint
        
        configureComponent()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureComponent() {
        
        addSubview(posterImageView)
        addSubview(movieNameLabel)
        addSubview(directorNameLabel)
        addSubview(movieInfoLabel)
        addSubview(dateLabel)
        
        NSLayoutConstraint.activate([
            posterImageView.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            posterImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            posterImageView.heightAnchor.constraint(equalToConstant: 120),
            posterImageView.widthAnchor.constraint(equalToConstant: 80),
            
            movieNameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            movieNameLabel.leadingAnchor.constraint(equalTo: posterImageView.trailingAnchor, constant: 20),
            movieNameLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20),
            
            directorNameLabel.topAnchor.constraint(equalTo: movieNameLabel.bottomAnchor, constant: 5),
            directorNameLabel.leadingAnchor.constraint(equalTo: posterImageView.trailingAnchor, constant: 20),
            directorNameLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20),
            
            movieInfoLabel.topAnchor.constraint(equalTo: directorNameLabel.bottomAnchor, constant: 5),
            movieInfoLabel.leadingAnchor.constraint(equalTo: posterImageView.trailingAnchor, constant: 20),
            movieInfoLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20),
            
            dateLabel.leadingAnchor.constraint(equalTo: posterImageView.trailingAnchor, constant: 20),
            dateLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20),
            dateLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20)
        ])
    }
}
