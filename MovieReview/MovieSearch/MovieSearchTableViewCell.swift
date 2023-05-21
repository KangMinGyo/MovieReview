//
//  MovieSearchTableViewCell.swift
//  MovieReview
//
//  Created by KangMingyo on 2023/05/21.
//

import UIKit

class MovieSearchTableViewCell: UITableViewCell {
    
    static let identifier = "ReviewCell"
    
    //MARK: - Properties
    
    let movieNameLabel: UILabel = {
        let label = UILabel()
        label.text = "영화제목"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let directorLabel: UILabel = {
        let label = UILabel()
        label.text = "영화감독"
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
    
    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 5
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    //MARK: - Lifecycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        [movieNameLabel, directorLabel, movieInfoLabel].forEach {
            self.stackView.addArrangedSubview($0)
        }

        configureComponent()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Configure
    
    func configureComponent() {
        addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            stackView.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
}
