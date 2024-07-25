//
//  MovieSearchViewController.swift
//  TeamOne1
//
//  Created by 유민우 on 7/25/24.
//

import UIKit
import SnapKit
import Kingfisher

class MovieSearchViewController: UIViewController {
    
    let movieSearchView = MovieSearchView()
    var movies = [MovieListModel]() // 데이터 저장 배열
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSearchView()
        
        // searchBar 설정
        movieSearchView.searchBar.delegate = self
        movieSearchView.searchBar.placeholder = "영화 검색"
        
        // collectionView 설정
        movieSearchView.movieCollectionView.delegate = self
        movieSearchView.movieCollectionView.dataSource = self
        movieSearchView.movieCollectionView.register(SearchMovieCollectionViewCell.self, forCellWithReuseIdentifier: "movieCell")
        
        // 나우 플레잉 무비 네트워크에서 현재 상영중인 영화 데이터를 가져옴
        SearchMovieNetwork.shared.fetchNowPlayingMovies { [weak self] result in
            switch result {
            case .success(let movies):
                self?.movies = movies
                DispatchQueue.main.async {
                    self?.movieSearchView.movieCollectionView.reloadData()
                }
            case . failure(let error):
                print("Error fetching movies: \(error)")
            }
        }
    }
    
    private func setupSearchView() {
      view.addSubview(movieSearchView)
      movieSearchView.snp.makeConstraints {
        $0.edges.equalToSuperview()
      }
    }
    
}

extension MovieSearchViewController: UISearchBarDelegate {
    // 검색 기능 구현
}

extension MovieSearchViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "movieCell", for: indexPath) as! SearchMovieCollectionViewCell
        let movie = movies[indexPath.item]
        cell.ptTitleLabel.text = movie.title
        if let posterPath = movie.posterPath {
            let url = URL(string: "https://image.tmdb.org/t/p/w500\(posterPath)")
            cell.posterImageView.kf.setImage(with: url)
        } else {
            cell.posterImageView.image = UIImage(named: "winter")
        }
        return cell
    }
}


