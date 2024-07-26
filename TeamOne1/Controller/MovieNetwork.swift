//
//  SearchMovieNetwork.swift
//  TeamOne1
//
//  Created by 유민우 on 7/25/24.
//

// 영화 검색 페이지에서 사용할 네트워크 -> 가져오기
import Foundation

struct Constants {
    static let API_KEY = "4e7d627f53b0470f38e13533b907923c"
  static let BASE_URL = "https://api.themoviedb.org/3/movie/"
  

}

final class MovieNetwork {
    
    static let shared = MovieNetwork() // 싱글톤 패턴
    
    // 현재 상영중인 영화 데이터 가져오기
    func fetchNowPlayingMovies(page: Int, completion: @escaping (Result<[MovieListModel], Error>) -> Void) {
      let urlString = "\(Constants.BASE_URL)now_playing?api_key=\(Constants.API_KEY)&language=ko-KR&page=\(page)&region=KR"
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
  
  //MARK: 김리인
  func getData<T: Decodable>(endPoint: String, callback: @escaping (T?) -> Void) {
      let session = URLSession(configuration: .default)
      guard let url = URL(string: endPoint) else { return }
      session.dataTask(with: URLRequest(url: url)) { data, response, error in
        guard let resultData = data, error == nil else {
          print("데이터 로드 실패")
          callback(nil)
          return
        }
        let successRange = 200..<300
        if let response = response as? HTTPURLResponse, successRange.contains(response.statusCode){
          guard let decodedData = try? JSONDecoder().decode(T.self, from: resultData) else {
            print("JSON 디코딩 실패")
            callback(nil)
            return
          }
          callback(decodedData)
        }else {
          print("응답 오류")
          callback(nil)
        }
      }.resume()
    }
    
}

