//
//  SettingView.swift
//  MovieReview
//
//  Created by KangMingyo on 2023/07/27.
//

import UIKit

class SettingViewController: UIViewController {
    
    //MARK: - Properties
    
    let topLineView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray6
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var feedbackButton: UIButton = {
        let button = UIButton(type: UIButton.ButtonType.system)
        button.setTitle("피드백", for: .normal)
        button.contentHorizontalAlignment = .leading
        button.titleEdgeInsets = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 0)
        button.tintColor = .gray
        button.addTarget(self, action: #selector(feedbackButtonAction), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    @objc func feedbackButtonAction() {
        sendMail()
    }
    
    let buttomLineView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray6
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        configureComponent()
    }
    
    //MARK: - Configure
    
    func configureComponent() {
        view.addSubview(topLineView)
        view.addSubview(feedbackButton)
        view.addSubview(buttomLineView)
        
        NSLayoutConstraint.activate([
            topLineView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            topLineView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            topLineView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            topLineView.heightAnchor.constraint(equalToConstant: 1),
            
            feedbackButton.topAnchor.constraint(equalTo: topLineView.bottomAnchor, constant: 10),
            feedbackButton.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            feedbackButton.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            buttomLineView.topAnchor.constraint(equalTo: feedbackButton.bottomAnchor, constant: 10),
            buttomLineView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            buttomLineView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            buttomLineView.heightAnchor.constraint(equalToConstant: 1),
        ])
    }
}
