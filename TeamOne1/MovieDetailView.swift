//
//  MovieDetailView.swift
//  TeamOne1
//
//  Created by bloom on 7/22/24.
//

import Foundation
import UIKit

final class MovieDetailView: UIView {
  private let imgLabel = {
    let lb = UIImageView()
    return lb
  }()
  private let nameLabel = {
    let lb = UILabel()
    return lb
  }()
  private let movieDescription = {
    let lb = UIScrollView()
    
    return lb
  }()
  private let rating = {
    let lb = UILabel()
    return lb
  }()
  private let releaseData = {
    let lb = UILabel()
    return lb
  }()
  private let TicketingBtn = {
    let btn = UIButton()
    return btn
  }()
  private let vstackView = {
    let sv = UIStackView()
    return sv
  }()
  
  
  override init(frame: CGRect) {
    super.init(frame: frame)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
