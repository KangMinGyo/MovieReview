//
//  BoxOfficeViewController.swift
//  MovieReview
//
//  Created by KangMingyo on 2023/06/05.
//

import UIKit

class BoxOfficeViewController: UIViewController {
    var viewModel = BoxOfficeViewModel()
    
    //MARK: - Properties
    
    private let loadingView: LoadingView = {
        let view = LoadingView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
      }()
    
    private let collectionView: UICollectionView = {
        let flowlayout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowlayout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()

    lazy var movieSearchButton: UIBarButtonItem = {
        let button = UIBarButtonItem(image: UIImage(systemName: "pencil"),
                                     style: .plain,
                                     target: self,
                                     action: #selector(movieSearchButtonPressed))
        button.tintColor = .gray
        return button
    }()
    
    @objc func movieSearchButtonPressed() {
        let nextVC = MovieSearchViewController()
        self.show(nextVC, sender: self)
    }
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "박스오피스 순위"
        navigationItem.rightBarButtonItem = movieSearchButton
        configureCollectionView()
        configureComponent()
        
        self.loadingView.isLoading = true
        self.getSomeData { [weak self] in
            self?.loadingView.isLoading = false
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        viewModel.getBoxOfficeDatas(date: Date().yesterdayDate()) {
            if self.viewModel.boxOfficeData.count == 10 {
                self.viewModel.getBoxOfficeMoviePoster()
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
            }
        }
    }
    
    private func getSomeData(completion: @escaping () -> ()) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            print("박스오피스 완료")
            completion()
        }
    }
    
    //MARK: - Configure
    
    func configureCollectionView() {
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(BoxOfficeCollectionViewCell.self, forCellWithReuseIdentifier: BoxOfficeCollectionViewCell.identifier)
    }
    
    func configureComponent() {

        view.addSubview(loadingView)
        view.addSubview(collectionView)
        view.bringSubviewToFront(self.loadingView)

        NSLayoutConstraint.activate([
            loadingView.topAnchor.constraint(equalTo: view.topAnchor),
            loadingView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            loadingView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            loadingView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

extension BoxOfficeViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.boxOfficeData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BoxOfficeCollectionViewCell.identifier, for: indexPath) as! BoxOfficeCollectionViewCell
        cell.setup(with: viewModel.boxOfficeData[indexPath.row])

        DispatchQueue.main.async {
            if self.viewModel.posterUrl.count == 10 {
                cell.setPosterImage(with: self.viewModel.posterUrl[indexPath.row])
            }
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

    }
}

extension BoxOfficeViewController: UICollectionViewDelegate {
    
}

extension BoxOfficeViewController: UICollectionViewDelegateFlowLayout {
    //Cell의 크기
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width - 20, height: view.frame.width / 2.5)
    }
    
    //Cell간의 간격
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    //상하좌우 공백
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
    }
}
