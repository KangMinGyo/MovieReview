//
//  directingView.swift
//  MovieReview
//
//  Created by KangMingyo on 2023/05/22.
//

import UIKit

class DirectingView: UIView {
    
    var isActivated : Bool = false {
          didSet {
              if isActivated {
                  directorLabel.textColor = UIColor(named: "mrRed")
              } else {
                  directorLabel.textColor = .black
              }
          }
      }
    
    let imageSize = CGSize(width: 50, height: 50)
    
    lazy var directorButton: UIButton = {
        let button = UIButton()
        let directorImage = UIImage(named: "director")?.resize(targetSize: imageSize)
        button.setBackgroundImage(directorImage, for: UIControl.State.normal)
        button.addTarget(self, action: #selector(directorButtonAction), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let directorLabel: UILabel = {
        let label = UILabel()
        label.text = "연출"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    @objc func directorButtonAction() {
        isActivated.toggle()
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
        self.addSubview(directorButton)
        self.addSubview(directorLabel)
        configureComponent()
    }
    
    func configureComponent() {
        NSLayoutConstraint.activate([
            directorButton.topAnchor.constraint(equalTo: topAnchor),
            directorButton.leadingAnchor.constraint(equalTo: leadingAnchor),
            directorButton.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            directorLabel.topAnchor.constraint(equalTo: directorButton.bottomAnchor, constant: 5),
            directorLabel.centerXAnchor.constraint(equalTo: directorButton.centerXAnchor),
            directorLabel.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}

