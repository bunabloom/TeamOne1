//
//  MovieListViewController.swift
//  TeamOne1
//
//  Created by 유민우 on 7/23/24.


import UIKit
import SnapKit

class MovieListViewController: UIViewController {
  
  let movieListView = MovieListView()
  
  let network = NetworkController()
  
  /* naigation controller 적극활용
   */
  override func viewDidLoad() {
    super.viewDidLoad()
    setupMovieList()
    
    movieListView.movieListViewController = self
    
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
  

