//
//  PopUpView.swift
//  MovieReview
//
//  Created by KangMingyo on 2023/06/14.
//

import UIKit

class PopUpViewController: UIViewController {
    //MARK: - Properties
    
    private let popUpView: PopUpView = {
       let view = PopUpView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        view.layer.opacity = 1.0
        addSubView()
    }
    
    //MARK: - Configure

    func addSubView() {
        view.addSubview(popUpView)

        configureComponent()
    }

    func configureComponent() {
        NSLayoutConstraint.activate([
            popUpView.topAnchor.constraint(equalTo: view.topAnchor),
            popUpView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            popUpView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            popUpView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}
