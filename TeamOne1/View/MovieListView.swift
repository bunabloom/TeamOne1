//
//  MovieListView.swift
//  TeamOne1
//
//  Created by 유민우 on 7/23/24.
//

import UIKit
import SnapKit

class MovieListView: UIView {
  
  
  
  
  let tableView = UITableView()
  let titles = ["개봉 예정 영화", "상영중인 영화", "인기순위"]
  override init(frame: CGRect) {
    super.init(frame: frame)
    configureUI()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  // 제약조건 추가
  private func configureUI() {
    
    self.backgroundColor = .white
    addSubview(tableView)
    
    
    tableView.snp.makeConstraints {
      $0.top.equalToSuperview().offset(5)
      $0.leading.trailing.equalToSuperview()
      $0.bottom.equalToSuperview()
    }
    
    tableView.delegate = self
    tableView.dataSource = self
    tableView.register(MvListTableViewCell.self, forCellReuseIdentifier: MvListTableViewCell.id)
    
  }
  
  
}


extension MovieListView: UITableViewDelegate, UITableViewDataSource {
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return titles.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: MvListTableViewCell.id, for: indexPath) as! MvListTableViewCell
    cell.titleLabel.text = titles[indexPath.row] // 타이틀 설정
    
    // 각 행에 맞는 데이터를 전달
    if indexPath.row == 0 {
      cell.updateCollectionView(with: NetworkController.upcomingMovies)
    }
    
    return cell
  }
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 200
  }
  
}
