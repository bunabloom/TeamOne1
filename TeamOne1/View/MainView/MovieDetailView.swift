//
//  MovieDetailView.swift
//  TeamOne1
//
//  Created by bloom on 7/22/24.
//

import Foundation
import UIKit
import SnapKit


final class MovieDetailView: UIView {
  private let imgLabel = {
    let lb = UIImageView()
    lb.backgroundColor = .gray
    return lb
  }()
  private let nameLabel = {
    let lb = UILabel()
    lb.text = "영화이름"
    lb.textAlignment = .left
    lb.font = .systemFont(ofSize: 25)
    return lb
  }()
  private let movieDescription = {
    let lb = UIScrollView()
    lb.backgroundColor = .blue
    return lb
  }()
  private let dsView = {
    let lb = UITextView()
    
    lb.text = "!@#########################################"
    lb.textColor = .black
    return lb
  }()
  
  private let rating = {
    let lb = UILabel()
    lb.text = "별점: 7.8/10 점"
    lb.textAlignment = .left
    return lb
  }()
  private let releaseData = {
    let lb = UILabel()
    lb.text = "출시일: 2021-07-07"
    lb.textAlignment = .right
    lb.font.withSize(10)
    return lb
  }()
  private let TicketingBtn = {
    let btn = UIButton()
    btn.setTitle("예매하기", for: .normal)
    btn.setTitleColor(.white, for: .normal)
    btn.titleLabel?.font = .boldSystemFont(ofSize: 30)
    btn.backgroundColor = .red
    return btn
  }()
  private let vstackView = {
    let sv = UIStackView()
    sv.axis = .horizontal
    sv.distribution = .fillEqually
    return sv
  }()
  
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    configureUI()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  
  
  private func configureUI(){
    self.backgroundColor = .white
    [
      imgLabel,
      nameLabel,
      movieDescription,
      vstackView,
      TicketingBtn
      
    ].forEach{addSubview($0)}
    
    [
      rating,
      releaseData
    ].forEach{vstackView.addArrangedSubview($0)}
    
    movieDescription.addSubview(dsView)
    dsView.snp.makeConstraints{
      $0.edges.equalTo(movieDescription)
    }
    
    
    
    imgLabel.snp.makeConstraints{
      $0.centerX.equalTo(safeAreaLayoutGuide)
      $0.height.equalTo(350)
      $0.top.equalTo(safeAreaLayoutGuide).offset(30)
      $0.width.equalTo(275)
    }
    nameLabel.snp.makeConstraints{
      $0.top.equalTo(imgLabel.snp.bottom).offset(1)
      $0.leading.equalTo(imgLabel.snp.leading)
      $0.width.equalTo(imgLabel)
      $0.height.equalTo(50)
    }
    movieDescription.snp.makeConstraints{
      $0.width.equalTo(imgLabel)
      $0.top.equalTo(nameLabel.snp.bottom).offset(10)
      $0.centerX.equalTo(safeAreaLayoutGuide)
      $0.height.equalTo(150)
      
    }
    vstackView.snp.makeConstraints{
      $0.width.equalTo(imgLabel)
      $0.height.equalTo(40)
      $0.centerX.equalTo(safeAreaLayoutGuide)
      $0.top.equalTo(movieDescription.snp.bottom).offset(10)
    }
    TicketingBtn.snp.makeConstraints{
      $0.bottom.equalToSuperview()
      $0.width.equalTo(safeAreaLayoutGuide)
      $0.height.equalTo(70)
      $0.centerX.equalTo(safeAreaLayoutGuide)
    }

    
  }
}
