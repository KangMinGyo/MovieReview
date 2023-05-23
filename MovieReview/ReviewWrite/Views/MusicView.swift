//
//  musicView.swift
//  MovieReview
//
//  Created by KangMingyo on 2023/05/22.
//

import UIKit

class MusicView: UIView {

    var isActivated : Bool = false {
          didSet {
              if isActivated {
                  musicLabel.textColor = UIColor(named: "mrRed")
              } else {
                  musicLabel.textColor = .black
              }
          }
      }
    
    let imageSize = CGSize(width: 50, height: 50)
    
    lazy var musicButton: UIButton = {
        let button = UIButton()
        let musicImage = UIImage(named: "music")?.resize(targetSize: imageSize)
        button.setBackgroundImage(musicImage, for: UIControl.State.normal)
        button.addTarget(self, action: #selector(musicButtonAction), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let musicLabel: UILabel = {
        let label = UILabel()
        label.text = "OST"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    @objc func musicButtonAction() {
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
        self.addSubview(musicButton)
        self.addSubview(musicLabel)
        configureComponent()
    }
    
    func configureComponent() {
        NSLayoutConstraint.activate([
            musicButton.topAnchor.constraint(equalTo: topAnchor),
            musicButton.leadingAnchor.constraint(equalTo: leadingAnchor),
            musicButton.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            musicLabel.topAnchor.constraint(equalTo: musicButton.bottomAnchor, constant: 5),
            musicLabel.centerXAnchor.constraint(equalTo: musicButton.centerXAnchor),
            musicLabel.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
