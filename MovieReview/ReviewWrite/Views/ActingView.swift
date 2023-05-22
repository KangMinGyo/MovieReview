//
//  actingView.swift
//  MovieReview
//
//  Created by KangMingyo on 2023/05/22.
//

import UIKit

class ActingView: UIView {
    
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
    
    lazy var actingButton: UIButton = {
        let button = UIButton()
        let actingImage = UIImage(named: "Acting")?.resize(targetSize: imageSize)
        button.setBackgroundImage(actingImage, for: UIControl.State.normal)
        button.addTarget(self, action: #selector(actingButtonAction), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let actingLabel: UILabel = {
        let label = UILabel()
        label.text = "연기"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    @objc func actingButtonAction() {
        print("acting Button tapped")
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
        self.addSubview(actingButton)
        self.addSubview(actingLabel)
        configureComponent()
    }
    
    func configureComponent() {
        NSLayoutConstraint.activate([
            actingButton.topAnchor.constraint(equalTo: topAnchor),
            actingButton.leadingAnchor.constraint(equalTo: leadingAnchor),
            actingButton.trailingAnchor.constraint(equalTo: trailingAnchor),
            actingButton.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            actingLabel.topAnchor.constraint(equalTo: actingButton.bottomAnchor, constant: 5),
            actingLabel.centerXAnchor.constraint(equalTo: actingButton.centerXAnchor)
        ])
    }
}
