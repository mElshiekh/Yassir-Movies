//
//  MovieDetails.swift
//  YassirApp
//
//  Created by Elshiekh on 27/10/2023.
//

import Foundation

class MovieDetails: Movie {
    var overview: String?
    var genres: String?

    init(id: Int? = nil,
         poster: String? = nil,
         title: String? = nil,
         releaseDate: Date? = nil,
         rating: Double? = nil,
         overview: String? = nil,
         genres: String? = nil) {
        super.init(id: id,
                   poster: poster,
                   title: title,
                   releaseDate: releaseDate,
                   rating: rating)
        self.overview = overview
        self.genres = genres
    }
    
}
