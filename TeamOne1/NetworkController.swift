//
//  NetworkController.swift
//  TeamOne1
//
//  Created by bloom on 7/24/24.
//

import Foundation

struct NetworkController {
  
  static var upcomingMovies: [UpcomingModel] = []
  
  func fetchUpcomingMovies() async {
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
      NetworkController.upcomingMovies = response.results
    } catch {
      print("Failed to fetch movies: \(error)")
    }
  }
}
