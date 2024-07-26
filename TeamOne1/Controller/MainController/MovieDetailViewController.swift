//
//  MovieDetailViewController.swift
//  TeamOne1
//
//  Created by bloom on 7/23/24.
//

import UIKit
import SnapKit

final class MovieDetailViewController: UIViewController{
  let movieDetailView = MovieDetailView()
  var movie: MovieListModel?
  override func viewDidLoad() {
    super.viewDidLoad()
    configureUI()
    
    
    if let movie = movie{
      print("movie id : \(movie.id)")
    }
  }
  
  private func configureUI() {
    view.addSubview(movieDetailView)
    
    movieDetailView.snp.makeConstraints{
      $0.edges.equalToSuperview()
    }
  }
}
