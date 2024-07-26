//
//  MvListTableViewCell.swift
//  TeamOne1
//
//  Created by 유민우 on 7/23/24.
//

import UIKit
import SnapKit

final class MvListTableViewCell: UITableViewCell {
    static let id = "MvListTableViewCell"
  weak var movieListViewController: MovieListViewController?
    let collectionView: UICollectionView
    let titleLabel: UILabel = {
        let lb = UILabel()
        lb.font = UIFont.boldSystemFont(ofSize: 25)
        return lb
    }()
    var movies: [MovieListModel] = []
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 100, height: 200) // 아이템 높이를 200으로 변경하여 제목을 포함할 수 있게 설정
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        contentView.addSubview(titleLabel)
        contentView.addSubview(collectionView)
        
        titleLabel.snp.makeConstraints { make in
            make.top.left.right.equalToSuperview().inset(10)
        }
        
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(10)
            make.left.right.bottom.equalToSuperview().inset(10)
            make.height.equalTo(200) // 높이를 고정하여 스크롤 문제가 발생하지 않도록 설정
        }
        
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(MvCollectionViewCell.self, forCellWithReuseIdentifier: MvCollectionViewCell.id)
        
        collectionView.showsHorizontalScrollIndicator = false // 스크롤바 숨김 설정
    }
    
    func updateCollectionView(with movies: [MovieListModel]) {
        self.movies = movies
        collectionView.reloadData()
    }
}

extension MvListTableViewCell: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MvCollectionViewCell.id, for: indexPath) as! MvCollectionViewCell
        let movie = movies[indexPath.item]
        cell.configure(with: movie)
        return cell
    }
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
 
  
      movieListViewController?.navigationController?.pushViewController(MovieDetailViewController(), animated: true)
  }
}
