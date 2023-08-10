//
//  PopUpView.swift
//  MovieReview
//
//  Created by KangMingyo on 2023/06/14.
//

import UIKit

class PopUpViewController: UIViewController {
    
    let viewModel = PopUpViewModel()
    let vc = MovieReviewDetailViewController()
    var isUpdate = false
    
    //MARK: - Properties
    
    let popUpView: PopUpView = {
       let view = PopUpView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    @objc func editButtonAction() {
        print("수정")
        let nextVC = ReviewUpdateViewController()
        nextVC.viewModel.index = viewModel.index
        nextVC.modalPresentationStyle = .fullScreen
        self.present(nextVC, animated: true)
        isUpdate = true
    }
    
    @objc func deleteButtonAction() {
        print("삭제")
        viewModel.deleteReview()
        self.dismiss(animated: true)
    }

    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .clear
        addSubView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("pop view wiil")
        if isUpdate {
            //PopUpView Dismiss
            self.dismiss(animated: true)
            print("---Dismiss---")
            self.isUpdate = false
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        presentingViewController?.viewWillAppear(true)
    }
   
    //MARK: - Configure

    func addSubView() {
        view.addSubview(popUpView)

        configureComponent()
        setUpButton()
    }

    func configureComponent() {
        NSLayoutConstraint.activate([
            popUpView.topAnchor.constraint(equalTo: view.topAnchor),
            popUpView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            popUpView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            popUpView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    func setUpButton() {
        popUpView.editButton.addTarget(self, action: #selector(editButtonAction), for: .touchUpInside)
        popUpView.deleteButton.addTarget(self, action: #selector(deleteButtonAction), for: .touchUpInside)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
            self.dismiss(animated: true, completion: nil)
        }
}
