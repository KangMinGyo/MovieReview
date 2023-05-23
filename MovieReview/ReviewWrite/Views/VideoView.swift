//
//  videoView.swift
//  MovieReview
//
//  Created by KangMingyo on 2023/05/22.
//

import UIKit

class VideoView: UIView {

    var isActivated : Bool = false {
          didSet {
              if isActivated {
                  vedioLabel.textColor = UIColor(named: "mrRed")
              } else {
                  vedioLabel.textColor = .black
              }
          }
      }
    
    let imageSize = CGSize(width: 50, height: 50)
    
    lazy var videoButton: UIButton = {
        let button = UIButton()
        let videoImage = UIImage(named: "video")?.resize(targetSize: imageSize)
        button.setBackgroundImage(videoImage, for: UIControl.State.normal)
        button.addTarget(self, action: #selector(videoButtonAction), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let vedioLabel: UILabel = {
        let label = UILabel()
        label.text = "영상미"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    @objc func videoButtonAction() {
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
        self.addSubview(videoButton)
        self.addSubview(vedioLabel)
        configureComponent()
    }
    
    func configureComponent() {
        NSLayoutConstraint.activate([
            videoButton.topAnchor.constraint(equalTo: topAnchor),
            videoButton.leadingAnchor.constraint(equalTo: leadingAnchor),
            videoButton.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            vedioLabel.topAnchor.constraint(equalTo: videoButton.bottomAnchor, constant: 5),
            vedioLabel.centerXAnchor.constraint(equalTo: videoButton.centerXAnchor),
            vedioLabel.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
