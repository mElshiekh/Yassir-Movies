//
//  MoviesResponse+Mapping.swift
//  YassirApp
//
//  Created by Elshiekh on 27/10/2023.
//  Copyright (c) 2023. All rights reserved.
//

import Foundation

struct MoviesResponseDTO: Codable {
    let page: Int
    let results: [MovieResponseDTO]
    let totalPages, totalResults: Int

    enum CodingKeys: String, CodingKey {
        case page, results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}

struct MovieResponseDTO: Codable {
    let adult: Bool?
    let backdropPath: String?
    let genreIDS: [Int]?
    let id: Int?
    let originalLanguage, originalTitle, overview: String?
    let popularity: Double?
    let posterPath, releaseDate, title: String?
    let video: Bool?
    let voteAverage: Double?
    let voteCount: Int?

    enum CodingKeys: String, CodingKey {
        case adult
        case backdropPath = "backdrop_path"
        case genreIDS = "genre_ids"
        case id
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case overview, popularity
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case title, video
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
}

extension MovieResponseDTO: Mapper {
    func toDomain() -> Movie {
        var poster: String?
        if let posterPath = posterPath {
            poster = StaticDataManager.shared.imageBaseURL + posterPath
        }
        let releaseDate = Date(from: self.releaseDate)
        let movie = Movie(id: id,
                          poster: poster,
                          title: title,
                          releaseDate: releaseDate,
                          rating: voteAverage,
                          overview: overview)
        return movie
    }
}
