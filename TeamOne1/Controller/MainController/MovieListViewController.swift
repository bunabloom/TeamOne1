//
//  MovieListViewController.swift
//  TeamOne1
//
//  Created by 유민우 on 7/23/24.


import UIKit
import SnapKit

final class MovieListViewController: UIViewController {
    
    let movieListView = MovieListView()
    let titles = ["-  상영예정 영화 🎥  - ", "-  상영중인 영화 🎥  -", "-  현재 인기순위 🎥  -"] // 각 행의 타이틀 배열
    var upcomingMovies: [MovieListModel] = []
    var nowPlayingMovies: [MovieListModel] = []
    var popularMovies: [MovieListModel] = []
        override func viewDidLoad() {
        super.viewDidLoad()
        setupMovieList()
        
        movieListView.tableView.dataSource = self
        movieListView.tableView.delegate = self
        
        movieListView.tableView.register(MvListTableViewCell.self, forCellReuseIdentifier: MvListTableViewCell.id)
        
        Task {
            await fetchUpcomingMovies()
            await fetchNowPlayingMovies()
            await fetchPopularMovies()
            movieListView.tableView.reloadData()
        }
    }
    
    private func setupMovieList() {
        view.addSubview(movieListView)
        movieListView.snp.makeConstraints {
            $0.edges.equalToSuperview()
          $0.bottom.equalToSuperview()
        }
    }
    
    private func fetchUpcomingMovies() async {
        await fetchMovies(from: "https://api.themoviedb.org/3/movie/upcoming", language: "ko-KR") { movies in
            self.upcomingMovies = movies
        }
    }
    
    private func fetchNowPlayingMovies() async {
        await fetchMovies(from: "https://api.themoviedb.org/3/movie/now_playing", language: "ko-KR") { movies in
            self.nowPlayingMovies = movies
        }
    }
    
    private func fetchPopularMovies() async {
        await fetchMovies(from: "https://api.themoviedb.org/3/movie/popular", language: "ko-KR") { movies in
            self.popularMovies = movies
        }
    }
    
    private func fetchMovies(from urlString: String, language: String, completion: @escaping ([MovieListModel]) -> Void) async {
        let url = URL(string: urlString)!
        var components = URLComponents(url: url, resolvingAgainstBaseURL: true)!
        let queryItems: [URLQueryItem] = [
            URLQueryItem(name: "language", value: language),
            URLQueryItem(name: "page", value: "1"),
        ]
        components.queryItems = queryItems
        
        var request = URLRequest(url: components.url!)
        request.httpMethod = "GET"
        request.timeoutInterval = 10
        request.allHTTPHeaderFields = [
            "accept": "application/json",
            "Authorization": "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIxZmMzMWE5MTc2MTBjNTM2MWQ4YTIyZWMxMmRjNWZlMyIsIm5iZiI6MTcyMTcwNzczNS41Mjc3MTIsInN1YiI6IjY2OWYyYWE1NGI0OTYxOGI0OTJlNzY3YiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.waKjweehRkNo-6V380n0VBdkrGWv998aIu-2Zk82-Bw"
        ]
        
        do {
            let (data, _) = try await URLSession.shared.data(for: request)
            let decoder = JSONDecoder()
            let response = try decoder.decode(MovieResponse.self, from: data)
            completion(response.results)
        } catch {
            print("Failed to fetch movies: \(error)")
        }
    }
  
  
  func showMovieDetail(with movie: MovieListModel) {
    let detail = MovieDetailViewController()
    detail.movie = movie
    navigationController?.pushViewController(detail, animated: true)
  }
}

extension MovieListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titles.count // 행 개수 설정
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // 커스텀 셀을 dequeue
        let cell = tableView.dequeueReusableCell(withIdentifier: MvListTableViewCell.id, for: indexPath) as! MvListTableViewCell
        cell.titleLabel.text = titles[indexPath.row] // 타이틀 설정
      cell.movieListViewController = self
        cell.selectionStyle = .none
        // 각 행에 맞는 데이터를 전달
        switch indexPath.row {
        case 0:
            cell.updateCollectionView(with: upcomingMovies)
        case 1:
            cell.updateCollectionView(with: nowPlayingMovies)
        case 2:
            cell.updateCollectionView(with: popularMovies)
        default:
            break
        }
      return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 280 // 셀 높이 조정
    }
}

