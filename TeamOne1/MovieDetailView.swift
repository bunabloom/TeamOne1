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
    return lb
  }()
  private let movieDescription = {
    let lb = UIScrollView()
    lb.backgroundColor = .blue
    return lb
  }()
  private let rating = {
    let lb = UILabel()
    lb.text = "별점: 7.8/10 점"
    return lb
  }()
  private let releaseData = {
    let lb = UILabel()
    lb.text = "출시일: 2021-07-07"
    return lb
  }()
  private let TicketingBtn = {
    let btn = UIButton()
    btn.titleLabel?.text = "예매하기"
    return btn
  }()
  private let vstackView = {
    let sv = UIStackView()
    sv.axis = .horizontal
    return sv
  }()
  
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    configureUI()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  
  
  func configureUI(){
    
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
    
    imgLabel.snp.makeConstraints{
      $0.centerX.equalTo(safeAreaLayoutGuide)
      $0.height.equalTo(400)
      $0.top.equalTo(safeAreaLayoutGuide).offset(60)
      $0.width.equalTo(300)
    }
    nameLabel.snp.makeConstraints{
      $0.top.equalTo(imgLabel.snp.bottom).offset(1)
      $0.leading.equalTo(imgLabel.snp.leading)
      $0.width.equalTo(100)
      $0.height.equalTo(50)
    }
//    movieDescription.snp.makeConstraints{}
//    vstackView.snp.makeConstraints{}
//    TicketingBtn.snp.makeConstraints{}
//    rating.snp.makeConstraints{}
//    releaseData.snp.makeConstraints{}
    
  }
}
