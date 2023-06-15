//
//  PopUpView.swift
//  MovieReview
//
//  Created by KangMingyo on 2023/06/15.
//
import UIKit

class PopUpView: UIView {
    let viewModel = PopUpViewModel()
    
    //MARK: - Properties
    
    lazy var editButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .white
        button.setTitleColor(.black, for: .normal)
        button.setTitle("수정하기", for: .normal)
        button.layer.cornerRadius = 10
        button.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        button.addTarget(self, action: #selector(editButtonAction), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    lazy var deleteButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .white
        button.setTitleColor(.black, for: .normal)
        button.setTitle("삭제하기", for: .normal)
        button.layer.cornerRadius = 10
        button.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        button.addTarget(self, action: #selector(deleteButtonAction), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let editDeleteButtonStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 0
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    @objc func editButtonAction() {
        print("수정")
    }
    
    @objc func deleteButtonAction() {
        print("삭제")
        viewModel.deleteReview()
    }
    
    //MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Configure
    
    func addSubView() {
        self.addSubview(editDeleteButtonStackView)

        configureComponent()
        configureStackView()
    }
    
    func configureComponent() {
        NSLayoutConstraint.activate([
            editDeleteButtonStackView.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 20),
            editDeleteButtonStackView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            editDeleteButtonStackView.widthAnchor.constraint(equalToConstant: 200),
            editDeleteButtonStackView.heightAnchor.constraint(equalToConstant: 100)
        ])
    }
    
    func configureStackView() {
        [editButton, deleteButton].forEach {
            self.editDeleteButtonStackView.addArrangedSubview($0)
        }
    }
}
