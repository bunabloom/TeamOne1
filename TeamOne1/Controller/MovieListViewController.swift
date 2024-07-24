//
//  MovieListViewController.swift
//  TeamOne1
//
//  Created by 유민우 on 7/23/24.


import UIKit
import SnapKit

class MovieListViewController: UIViewController {
  
  let movieListView = MovieListView()
  let titles = ["개봉 예정 영화", "상영중인 영화", "인기순위"] // 각 행의 타이틀 배열
  var upcomingMovies: [UpcomingModel] = []
  override func viewDidLoad() {
    super.viewDidLoad()
    setupMovieList()
    
    movieListView.tableView.dataSource = self
    movieListView.tableView.delegate = self
    
    movieListView.tableView.register(MvListTableViewCell.self, forCellReuseIdentifier: MvListTableViewCell.id)
    Task {
      await fetchUpcomingMovies()
      movieListView.tableView.reloadData()
    }
  }
  private func setupMovieList() {
    view.addSubview(movieListView)
    movieListView.snp.makeConstraints {
      $0.edges.equalToSuperview()
    }
  }
  private func fetchUpcomingMovies() async {
    let url = URL(string: "https://api.themoviedb.org/3/movie/upcoming")!
    var components = URLComponents(url: url, resolvingAgainstBaseURL: true)!
    let queryItems: [URLQueryItem] = [
      URLQueryItem(name: "language", value: "ko-KR"),
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
      self.upcomingMovies = response.results
    } catch {
      print("Failed to fetch movies: \(error)")
    }
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
    
    // 각 행에 맞는 데이터를 전달
    if indexPath.row == 0 {
      cell.updateCollectionView(with: upcomingMovies)
    }
    
    return cell
  }
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 200
  }
}
