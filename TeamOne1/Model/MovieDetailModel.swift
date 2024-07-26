//
//  MovieDetailModel.swift
//  TeamOne1
//
//  Created by t2023-m0102 on 7/26/24.
//

import Foundation
// MARK: - MovieDetailModel
struct MovieDetailModel: Codable {
    let id: Int
    let overview, posterPath, releaseDate, title: String
    let voteAverage: Double
    enum CodingKeys: String, CodingKey {
        case id, overview
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case title
        case voteAverage = "vote_average"
    }
}
