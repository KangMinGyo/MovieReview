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
    
    let superView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        view.layer.opacity = 0.5
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let popUpView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        view.layer.opacity = 1.0
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
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
        addSubview(superView)
        addSubview(popUpView)
        popUpView.addSubview(editDeleteButtonStackView)

        configureComponent()
        configureStackView()
    }
    
    func configureComponent() {
        NSLayoutConstraint.activate([
            superView.topAnchor.constraint(equalTo: self.topAnchor),
            superView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            superView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            superView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            popUpView.centerYAnchor.constraint(equalTo: superView.centerYAnchor),
            popUpView.centerXAnchor.constraint(equalTo: superView.centerXAnchor),
            popUpView.widthAnchor.constraint(equalToConstant: 200),
            popUpView.heightAnchor.constraint(equalToConstant: 100),
            
            editDeleteButtonStackView.centerYAnchor.constraint(equalTo: popUpView.centerYAnchor, constant: 20),
            editDeleteButtonStackView.centerXAnchor.constraint(equalTo: popUpView.centerXAnchor),
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
