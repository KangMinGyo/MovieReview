//
//  GoodPointSelectView.swift
//  MovieReview
//
//  Created by KangMingyo on 2023/05/22.
//

import UIKit

class GoodPointSelectView: UIView {
    
    //MARK: - Properties
    
    private let whatLabel: UILabel = {
        let label = UILabel()
        label.text = "어떤 점이 좋았나요?"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let actingView : ActingView = {
        let view = ActingView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let directingView : DirectingView = {
        let view = DirectingView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let musicView : MusicView = {
        let view = MusicView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let storyView : StoryView = {
        let view = StoryView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let videoView : VideoView = {
        let view = VideoView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let buttonStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 20
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

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
        [actingView, directingView, storyView, musicView, videoView].forEach {
            self.buttonStackView.addArrangedSubview($0)
        }
    }
}
