//
//  MovieListViewController.swift
//  TeamOne1
//
//  Created by 유민우 on 7/23/24.


import UIKit
import SnapKit

class MovieListViewController: UIViewController {
  
  let movieListView = MovieListView()
  // 각 행의 타이틀 배열
  let network = NetworkController()
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupMovieList()
    Task {
      await network.fetchUpcomingMovies()
      movieListView.tableView.reloadData()
    }
    
    
  }
  
  private func setupMovieList() {
    view.addSubview(movieListView)
    movieListView.snp.makeConstraints {
      $0.edges.equalToSuperview()
    }
  }
  
  
}
  

