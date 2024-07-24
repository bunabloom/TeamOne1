//
//  MvCollectionViewCell.swift
//  TeamOne1
//
//  Created by 유민우 on 7/23/24.
//

import UIKit
import SnapKit
import Kingfisher

class MvCollectionViewCell: UICollectionViewCell {
  
  static let id = "MvCollectionViewCell"
  
  let imageView: UIImageView = {
    let iv = UIImageView()
    iv.contentMode = .scaleAspectFit
    iv.clipsToBounds = true
    return iv
  }()
  
  let titleLabel: UILabel = {
    let lb = UILabel()
    lb.text = "범죄도시4"
    lb.textAlignment = .center
    lb.font = .boldSystemFont(ofSize: 13)
    lb.textColor = .black
    return lb
  }()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    [
      imageView,
      titleLabel].forEach{ contentView.addSubview($0) }
    
    imageView.snp.makeConstraints {
      $0.centerX.equalToSuperview()
      $0.top.trailing.leading.equalToSuperview()
      //$0.height.equalTo(contentView.snp.width)
    }
    
    titleLabel.snp.makeConstraints {
      $0.top.equalTo(imageView.snp.bottom).offset(3)
      $0.centerX.equalToSuperview()
      $0.bottom.equalToSuperview()
    }
    
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  func configure(with movie: UpcomingModel) {
    titleLabel.text = movie.title
    if let posterPath = movie.posterPath {
      let url = URL(string: "https://image.tmdb.org/t/p/w500\(posterPath)")
      imageView.kf.setImage(with: url)
    }
  }
}


