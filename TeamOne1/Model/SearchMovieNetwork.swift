//
//  SearchMovieNetwork.swift
//  TeamOne1
//
//  Created by 유민우 on 7/25/24.
//

// 영화 검색 페이지에서 사용할 네트워크 -> 가져오기
import Foundation

struct Constants {
    static let apiKey = "4e7d627f53b0470f38e13533b907923c"
   // static let nowPlayingURL = "https://api.themoviedb.org/3/movie/now_playing?api_key=\(apiKey)&language=ko-KR&page=\(page)&region=KR"
}

final class SearchMovieNetwork {
    
    static let shared = SearchMovieNetwork() // 싱글톤 패턴
    
    // 현재 상영중인 영화 데이터 가져오기
    func fetchNowPlayingMovies(page: Int, completion: @escaping (Result<[MovieListModel], Error>) -> Void) {
        let urlString = "https://api.themoviedb.org/3/movie/now_playing?api_key=\(Constants.apiKey)&language=ko-KR&page=\(page)&region=KR"
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            guard let data = data else { return }
            do {
                let movieResponse = try JSONDecoder().decode(MovieResponse.self, from: data)
                completion(.success(movieResponse.results))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
    
}

