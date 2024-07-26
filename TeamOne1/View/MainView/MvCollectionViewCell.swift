//
//  MvCollectionViewCell.swift
//  TeamOne1
//
//  Created by 유민우 on 7/23/24.
//

import UIKit
import Kingfisher
import SnapKit

class MvCollectionViewCell: UICollectionViewCell {
    static let id = "MvCollectionViewCell"
    
    let imageView = UIImageView()
    let titleLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(imageView)
        contentView.addSubview(titleLabel)
        
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 15
        
        titleLabel.textAlignment = .center
        titleLabel.font = UIFont.systemFont(ofSize: 12)
        titleLabel.numberOfLines = 2
        
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupConstraints() {
        imageView.snp.makeConstraints {
            $0.top.equalTo(contentView)
            $0.leading.equalTo(contentView)
            $0.trailing.equalTo(contentView)
            $0.height.equalTo(contentView.snp.width).multipliedBy(1.5)
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(imageView.snp.bottom).offset(5)
            $0.leading.equalTo(contentView).offset(5)
            $0.trailing.equalTo(contentView).offset(-5)
            $0.bottom.equalTo(contentView).offset(-5)
        }
    }
    
    func configure(with movie: MovieListModel) {
        if let posterPath = movie.posterPath {
            let url = URL(string: "https://image.tmdb.org/t/p/w500" + posterPath)
            imageView.kf.setImage(with: url)
        } else {
            imageView.image = nil
        }
        titleLabel.text = movie.title
    }
}
