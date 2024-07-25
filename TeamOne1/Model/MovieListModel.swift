//
//  UpcomingModel.swift
//  TeamOne1
//
//  Created by t2023-m0102 on 7/24/24.
//

import Foundation

struct MovieResponse: Codable {
  let results: [MovieListModel]
}

enum MovieType: Codable {
    case nowPlaying
    case upComing
}

struct MovieListModel: Codable {
    let title: String
    let posterPath: String?
    let type: MovieType
  
  enum CodingKeys: String, CodingKey {
    case title
    case posterPath = "poster_path"
    case type
  }
}
