//
//  GoodPointSelectView.swift
//  MovieReview
//
//  Created by KangMingyo on 2023/05/22.
//

import UIKit

class GoodPointSelectView: UIView {
    
    let imageSize = CGSize(width: 50, height: 50)
    
    //MARK: - Properties
    
    private let whatLabel: UILabel = {
        let label = UILabel()
        label.text = "어떤 점이 좋았나요?"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
//    private let actingView : ActingView = {
//        let view = ActingView()
//        view.translatesAutoresizingMaskIntoConstraints = false
//        return view
//    }()
    
    //    private let musicView : MusicView = {
    //        let view = MusicView()
    //        view.translatesAutoresizingMaskIntoConstraints = false
    //        return view
    //    }()
        
    //    private let storyView : StoryView = {
    //        let view = StoryView()
    //        view.translatesAutoresizingMaskIntoConstraints = false
    //        return view
    //    }()
    //
    //    private let videoView : VideoView = {
    //        let view = VideoView()
    //        view.translatesAutoresizingMaskIntoConstraints = false
    //        return view
    //    }()
    
    lazy var actingButton: UIButton = {
        let button = UIButton()
        let actingImage = UIImage(named: "Acting")?.resize(targetSize: imageSize)
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
        print("클릭")
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
