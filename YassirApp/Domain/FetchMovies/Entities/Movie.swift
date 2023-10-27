//
//  Movie.swift
//  YassirApp
//
//  Created by Elshiekh on 27/10/2023.
//

import Foundation

class Movie {
    var id: Int?
    var poster: String?
    var title: String?
    var releaseDate: Date?
    var rating: Double?

    init(id: Int? = nil,
         poster: String? = nil,
         title: String? = nil,
         releaseDate: Date? = nil,
         rating: Double? = nil) {
        self.id = id
        self.poster = poster
        self.title = title
        self.releaseDate = releaseDate
        self.rating = rating
    }

    var releaseYear: String {
        releaseDate?.getDateString(format: .year) ?? "N/A"
    }
    
}
