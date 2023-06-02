//
//  MovieReviewCollectionViewCell.swift
//  MovieReview
//
//  Created by KangMingyo on 2023/05/13.
//

import UIKit

class MovieReviewCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "ReviewCell"
    
    //MARK: - Properties
    
    let posterImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "poster")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let movieNameLabel: UILabel = {
        let label = UILabel()
        label.text = "영화 제목"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let directorNameLabel: UILabel = {
        let label = UILabel()
        label.text = "영화 감독"
        label.font = .systemFont(ofSize: 15)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let movieInfoLabel: UILabel = {
        let label = UILabel()
        label.text = "미국 | 미스터리, 범죄 | 2000"
        label.font = .systemFont(ofSize: 15)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let dateLabel: UILabel = {
        let label = UILabel()
        label.text = "작성일: 23.01.19 오후 5:23"
        label.textColor = .systemGray2
        label.font = .systemFont(ofSize: 13)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    //MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.backgroundColor = .white
        
        addSubView()
        configureShadow()
        configureCornerRadius()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Configure
    
    func addSubView() {
        addSubview(posterImageView)
        addSubview(movieNameLabel)
        addSubview(directorNameLabel)
        addSubview(movieInfoLabel)
        addSubview(dateLabel)
        
        configureComponent()
    }
    
    func configureComponent() {
        NSLayoutConstraint.activate([
            posterImageView.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            posterImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            posterImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20),
            posterImageView.widthAnchor.constraint(equalToConstant: 75),
            
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
    
    private func configureShadow() {
        layer.shadowRadius = 3
        layer.shadowOffset = CGSize(width: 1, height: 1)
        layer.shadowOpacity = 0.25
        layer.shadowColor = UIColor.black.cgColor
        layer.masksToBounds = false
    }
    
    private func configureCornerRadius() {
        contentView.layer.cornerRadius = 15
        contentView.layer.masksToBounds = true
    }
}
