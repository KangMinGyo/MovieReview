//
//  GoodPointSelectView.swift
//  MovieReview
//
//  Created by KangMingyo on 2023/05/22.
//

import UIKit

class GoodPointSelectView: UIView {
    
    var goodPointSelected = [false, false, false, false, false]
    let imageSize = CGSize(width: 50, height: 50)
    
    //MARK: - Properties
    
    private let whatLabel: UILabel = {
        let label = UILabel()
        label.text = "어떤 점이 좋았나요?"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    lazy var actingButton: UIButton = {
        let button = UIButton()
        let actingImage = UIImage(named: "Acting")?.resize(targetSize: imageSize)
        button.tag = 0
        button.setBackgroundImage(actingImage, for: UIControl.State.normal)
        button.addTarget(self, action: #selector(goodPointButtonAction), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let actingLabel: UILabel = {
        let label = UILabel()
        label.text = "연기"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let actingStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.spacing = 5
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    lazy var directorButton: UIButton = {
        let button = UIButton()
        let directorImage = UIImage(named: "director")?.resize(targetSize: imageSize)
        button.tag = 1
        button.setBackgroundImage(directorImage, for: UIControl.State.normal)
        button.addTarget(self, action: #selector(goodPointButtonAction), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let directorLabel: UILabel = {
        let label = UILabel()
        label.text = "연출"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let directorStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.spacing = 5
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    lazy var musicButton: UIButton = {
        let button = UIButton()
        let musicImage = UIImage(named: "music")?.resize(targetSize: imageSize)
        button.tag = 2
        button.setBackgroundImage(musicImage, for: UIControl.State.normal)
        button.addTarget(self, action: #selector(goodPointButtonAction), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let musicLabel: UILabel = {
        let label = UILabel()
        label.text = "OST"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let musicStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.spacing = 5
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    lazy var storyButton: UIButton = {
        let button = UIButton()
        let storyImage = UIImage(named: "story")?.resize(targetSize: imageSize)
        button.tag = 3
        button.setBackgroundImage(storyImage, for: UIControl.State.normal)
        button.addTarget(self, action: #selector(goodPointButtonAction), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let storyLabel: UILabel = {
        let label = UILabel()
        label.text = "스토리"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let storyStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.spacing = 5
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    lazy var videoButton: UIButton = {
        let button = UIButton()
        let videoImage = UIImage(named: "video")?.resize(targetSize: imageSize)
        button.tag = 4
        button.setBackgroundImage(videoImage, for: UIControl.State.normal)
        button.addTarget(self, action: #selector(goodPointButtonAction), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let vedioLabel: UILabel = {
        let label = UILabel()
        label.text = "영상미"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let videoStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.spacing = 5
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let buttonStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 20
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    @objc func goodPointButtonAction(sender: UIButton) {
        if sender.tag == 0 {
            goodPointSelected[0].toggle()
            if goodPointSelected[0] == true {
                actingLabel.textColor = UIColor(named: "mrRed")
            } else {
                actingLabel.textColor = .black
            }
        } else if sender.tag == 1 {
            goodPointSelected[1].toggle()
            if goodPointSelected[1] == true {
                directorLabel.textColor = UIColor(named: "mrRed")
            } else {
                directorLabel.textColor = .black
            }
        } else if sender.tag == 2 {
            goodPointSelected[2].toggle()
            if goodPointSelected[2] == true {
                musicLabel.textColor = UIColor(named: "mrRed")
            } else {
                musicLabel.textColor = .black
            }
        } else if sender.tag == 3 {
            goodPointSelected[3].toggle()
            if goodPointSelected[3] == true {
                storyLabel.textColor = UIColor(named: "mrRed")
            } else {
                storyLabel.textColor = .black
            }
        } else {
            goodPointSelected[4].toggle()
            if goodPointSelected[4] == true {
                vedioLabel.textColor = UIColor(named: "mrRed")
            } else {
                vedioLabel.textColor = .black
            }
        }
    }

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
        self.addSubview(whatLabel)
        self.addSubview(buttonStackView)
        
        configureComponent()
        configureStackView()
    }
    
    func configureComponent() {
        NSLayoutConstraint.activate([
            whatLabel.topAnchor.constraint(equalTo: topAnchor),
            whatLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            whatLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            buttonStackView.topAnchor.constraint(equalTo: whatLabel.bottomAnchor, constant: 10),
            buttonStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            buttonStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            buttonStackView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    func configureStackView() {
        [actingButton, actingLabel].forEach {
            self.actingStackView.addArrangedSubview($0)
        }
        
        [directorButton, directorLabel].forEach {
            self.directorStackView.addArrangedSubview($0)
        }
        
        [musicButton, musicLabel].forEach {
            self.musicStackView.addArrangedSubview($0)
        }
        
        [storyButton, storyLabel].forEach {
            self.storyStackView.addArrangedSubview($0)
        }
        
        [videoButton, vedioLabel].forEach {
            self.videoStackView.addArrangedSubview($0)
        }
        
        [actingStackView, directorStackView, musicStackView, storyStackView, videoStackView].forEach {
            self.buttonStackView.addArrangedSubview($0)
        }
    }
}
