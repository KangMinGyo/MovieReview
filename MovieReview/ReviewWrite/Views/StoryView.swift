//
//  storyView.swift
//  MovieReview
//
//  Created by KangMingyo on 2023/05/22.
//

import UIKit

class StoryView: UIView {

    //    var isActivated : Bool = false {
    //        didSet {
    //            if isActivated {
    //
    //            } else {
    //
    //            }
    //        }
    //    }
    
    let imageSize = CGSize(width: 50, height: 50)
    
    lazy var storyButton: UIButton = {
        let button = UIButton()
        let storyImage = UIImage(named: "story")?.resize(targetSize: imageSize)
        button.setBackgroundImage(storyImage, for: UIControl.State.normal)
        button.addTarget(self, action: #selector(storyButtonAction), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let storyLabel: UILabel = {
        let label = UILabel()
        label.text = "스토리"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    @objc func storyButtonAction() {
        print("story Button tapped")
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
        self.addSubview(storyButton)
        self.addSubview(storyLabel)
        configureComponent()
    }
    
    func configureComponent() {
        NSLayoutConstraint.activate([
            storyButton.topAnchor.constraint(equalTo: topAnchor),
            storyButton.leadingAnchor.constraint(equalTo: leadingAnchor),
            storyButton.trailingAnchor.constraint(equalTo: trailingAnchor),
            storyButton.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            storyLabel.topAnchor.constraint(equalTo: storyButton.bottomAnchor, constant: 5),
            storyLabel.centerXAnchor.constraint(equalTo: storyButton.centerXAnchor),
            storyLabel.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }

}
