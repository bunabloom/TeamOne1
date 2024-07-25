//
//  SearchMovieCollectionViewCell.swift
//  TeamOne1
//
//  Created by 유민우 on 7/25/24.
//

import UIKit
import SnapKit

final class SearchMovieCollectionViewCell: UICollectionViewCell {
    
    // 영화 포스터이미지를 표시할 이미지 뷰
    let posterImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.layer.cornerRadius = 15
        return iv
    }()
    
    // 영화 제목을 표시할 라벨
    let ptTitleLabel: UILabel = {
        let lb = UILabel()
        lb.font = .boldSystemFont(ofSize: 15)
        lb.textColor = .white
        lb.numberOfLines = 0
        lb.backgroundColor = UIColor.black.withAlphaComponent(0.4)
        lb.textAlignment = .center
        return lb
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        [
            posterImageView,
            ptTitleLabel].forEach { contentView.addSubview($0) }
        
        posterImageView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.trailing.bottom.equalToSuperview()
        }
        
        ptTitleLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.bottom.equalToSuperview()
            $0.height.equalTo(30)
            $0.width.equalTo(90)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
