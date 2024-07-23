//
//  MovieListViewController.swift
//  TeamOne1
//
//  Created by 유민우 on 7/23/24.
//

import UIKit
import SnapKit

class MovieListViewController: UIViewController {

    let movieListView = MovieListView()
    let titles = ["개봉 예정 영화", "상영중인 영화", "인기순위"] // 각 행의 타이틀 배열

    override func viewDidLoad() {
        super.viewDidLoad()
        setupMovieList()

        movieListView.tableView.dataSource = self
        movieListView.tableView.delegate = self
        
        movieListView.tableView.register(MvListTableViewCell.self, forCellReuseIdentifier: MvListTableViewCell.id)
    }

    private func setupMovieList() {
        view.addSubview(movieListView)
        movieListView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}

extension MovieListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titles.count // 행 개수 설정
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // 커스텀 셀을 dequeue
        let cell = tableView.dequeueReusableCell(withIdentifier: MvListTableViewCell.id, for: indexPath) as! MvListTableViewCell
        cell.titleLabel.text = titles[indexPath.row] // 타이틀 설정
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
        
    }
}
