//
//  MovieDetailViewController.swift
//  TeamOne1
//
//  Created by bloom on 7/23/24.
//

import UIKit
import SnapKit
import Kingfisher

final class MovieDetailViewController: UIViewController{
  let movieDetailView = MovieDetailView()
  var movie: MovieListModel?
  override func viewDidLoad() {
    super.viewDidLoad()
    configureUI()
    loadData()
    movieDetailView.TicketingBtn.addTarget(self, action: #selector(changeView), for: .touchDown)
    
    
    
  }
  
  private func configureUI() {
    view.addSubview(movieDetailView)
    
    movieDetailView.snp.makeConstraints{
      $0.edges.equalToSuperview()
    }
  }
  
  private func loadData(){
    guard let movie = movie else {return}
      print("movie id : \(movie.id)")
    let url = "https://api.themoviedb.org/3/movie/\(movie.id)?api_key=4e7d627f53b0470f38e13533b907923c&language=ko-KR"
    MovieNetwork().getData(endPoint: url) {[weak self] (result: MovieDetailModel?) in
      guard let result,let self else { return }
      
      DispatchQueue.main.async {
        self.movieDetailView.nameLabel.text = result.title
        self.movieDetailView.releaseData.text = "\(result.releaseDate)"
        self.movieDetailView.dsView.text = result.overview
        self.movieDetailView.rating.text = "\(result.voteAverage)"
        
        guard let imageUrl = URL(string: "https://image.tmdb.org/t/p/w500\(result.posterPath)") else { return }
        self.movieDetailView.imgLabel.kf.setImage(with: imageUrl)

        
      }
      
    }
  }
    
    // 하프모달 메서드
    func showModal() {
        let vc = ReservationViewController()
        if let sheet = vc.sheetPresentationController {
            sheet.detents = [.medium()]
        }
        self.present(vc, animated: true)
    }
  
  @objc func changeView(){
    showModal()
  }
}
