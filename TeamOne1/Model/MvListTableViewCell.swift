//
//  MvListTableViewCell.swift
//  TeamOne1
//
//  Created by 유민우 on 7/23/24.
//

import UIKit
import SnapKit

class MvListTableViewCell: UITableViewCell {

    static let id = "MvListTableViewCell"

    var collectionView: UICollectionView
    let titleLabel: UILabel = {
        let lb = UILabel()
        lb.font = UIFont.boldSystemFont(ofSize: 25)
        return lb
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        // 컬렉션 뷰 레이아웃 정의
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 150, height: 150) // 아이템 크기 설정
        layout.minimumLineSpacing = 10 // 아이템 간의 간격설정
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)

        super.init(style: style, reuseIdentifier: reuseIdentifier)

        contentView.addSubview(titleLabel)
        contentView.addSubview(collectionView) // 테이블 뷰 셀 안에 컬렉션 뷰 넣기

        // 타이틀 라벨 제약 설정
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(10)
            $0.leading.equalToSuperview().inset(10)
        }

        // 컬렉션 뷰 제약 설정
        collectionView.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(10)
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalToSuperview()
        }

        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(MvCollectionViewCell.self, forCellWithReuseIdentifier: MvCollectionViewCell.id)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension MvListTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10 // 아이템 개수 설정
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MvCollectionViewCell.id, for: indexPath) as! MvCollectionViewCell
        
        // 예시 데이터 설정
        cell.titleLabel.text = "범죄도시4"
        cell.imageView.image = UIImage(named: "city") // 예시 이미지 설정
        
        return cell
    }
}
