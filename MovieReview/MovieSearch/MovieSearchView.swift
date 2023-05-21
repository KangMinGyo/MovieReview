//
//  MovieSearchView.swift
//  MovieReview
//
//  Created by KangMingyo on 2023/05/21.
//

import UIKit

class MovieSearchView: UIViewController {
    
    //MARK: - Properties
    
    let searchBar = UISearchBar()
    
    private let movieSearchTableView: UITableView = {
         let tableView = UITableView()
         tableView.rowHeight = 100
         tableView.translatesAutoresizingMaskIntoConstraints = false
         return tableView
     }()
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        title = "영화 검색"
        view.backgroundColor = .systemBackground
        
        configureTableView()
        setUpSearchBar()
        configureComponent()
    }
    
    //MARK: - Configure
    
    func configureTableView() {
        movieSearchTableView.delegate = self
        movieSearchTableView.dataSource = self
        movieSearchTableView.register(MovieSearchTableViewCell.self, forCellReuseIdentifier: MovieSearchTableViewCell.identifier)
        movieSearchTableView.tableHeaderView = searchBar
    }
    
    func setUpSearchBar() {
        searchBar.delegate = self
        searchBar.frame = (CGRect(x: 0, y: 0, width: 200, height: 70))
        searchBar.searchBarStyle = .minimal
        searchBar.placeholder = "리뷰 작성 할 영화를 검색해주세요."
    }
    
    func configureComponent() {
        view.addSubview(movieSearchTableView)
        
        NSLayoutConstraint.activate([
            movieSearchTableView.topAnchor.constraint(equalTo: view.topAnchor),
            movieSearchTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            movieSearchTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            movieSearchTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension MovieSearchView: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MovieSearchTableViewCell.identifier, for: indexPath) as! MovieSearchTableViewCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let nextVC = ReviewWriteViewController()
//        self.show(nextVC, sender: self)
    }
}

extension MovieSearchView: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        let movieName = searchBar.text
        searchBar.resignFirstResponder()
    }
}
