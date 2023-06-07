//
//  BoxOfficeCollectionViewCell.swift
//  MovieReview
//
//  Created by KangMingyo on 2023/06/05.
//

import UIKit

class BoxOfficeCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "BoxOfficeCell"
    
    //MARK: - Properties
    
    let posterImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let movieNameLabel: UILabel = {
        let label = UILabel()
        label.text = "영화 제목"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let openDateLabel: UILabel = {
        let label = UILabel()
        label.text = "2023-05-31 개봉"
        label.font = .systemFont(ofSize: 15)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let lineView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray5
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    //박스오피스 랭크
    let boxOfficeRank: UILabel = {
        let label = UILabel()
        label.text = "1"
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let boxOfficeLabel: UILabel = {
        let label = UILabel()
        label.text = "박스오피스"
        label.font = .systemFont(ofSize: 15)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let boxOfficeRankStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 5
        stackView.alignment = .center
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    //전일대비 순위의 증감분
    let rankInten: UILabel = {
        let label = UILabel()
        label.text = "-"
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let rankIntenLabel: UILabel = {
        let label = UILabel()
        label.text = "전일 대비"
        label.font = .systemFont(ofSize: 15)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let rankIntenStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 5
        stackView.alignment = .center
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    //누적 관객수
    let audiAcc: UILabel = {
        let label = UILabel()
        label.text = "100"
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let audiAccLabel: UILabel = {
        let label = UILabel()
        label.text = "누적관객수"
        label.font = .systemFont(ofSize: 15)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let audiAccStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 5
        stackView.alignment = .center
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    let movieInfoStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
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
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.posterImageView.image = nil
    }
    
    //MARK: - Configure
    
    func addSubView() {
        addSubview(posterImageView)
        addSubview(movieNameLabel)
        addSubview(openDateLabel)
        addSubview(lineView)
        addSubview(movieInfoStackView)
        
        configureComponent()
        configureStackView()
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
            
            openDateLabel.topAnchor.constraint(equalTo: movieNameLabel.bottomAnchor, constant: 5),
            openDateLabel.leadingAnchor.constraint(equalTo: posterImageView.trailingAnchor, constant: 20),
            openDateLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20),
            
            lineView.topAnchor.constraint(equalTo: openDateLabel.bottomAnchor, constant: 10),
            lineView.leadingAnchor.constraint(equalTo: posterImageView.trailingAnchor, constant: 20),
            lineView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            lineView.heightAnchor.constraint(equalToConstant: 1),
            
            movieInfoStackView.topAnchor.constraint(equalTo: lineView.bottomAnchor, constant: 10),
            movieInfoStackView.leadingAnchor.constraint(equalTo: posterImageView.trailingAnchor, constant: 20),
            movieInfoStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            movieInfoStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20)
        ])
    }
    
    func configureStackView() {
        [boxOfficeRank, boxOfficeLabel].forEach {
            self.boxOfficeRankStackView.addArrangedSubview($0)
        }
        
        [audiAcc, audiAccLabel].forEach {
            self.audiAccStackView.addArrangedSubview($0)
        }
        
        [rankInten, rankIntenLabel].forEach {
            self.rankIntenStackView.addArrangedSubview($0)
        }
        
        [boxOfficeRankStackView, rankIntenStackView, audiAccStackView].forEach {
            self.movieInfoStackView.addArrangedSubview($0)
        }
    }
    
    func setup(with data: DailyBoxOfficeList) {
//        cell.posterImageView.setImageUrl(data.)
        movieNameLabel.text = data.movieNm
        openDateLabel.text = data.openDt
        boxOfficeRank.text = data.rank
        rankInten.text = data.rankInten
        audiAcc.text = data.audiAcc
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
