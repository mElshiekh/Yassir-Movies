//
//  Movie.swift
//  YassirApp
//
//  Created by Elshiekh on 27/10/2023.
//

import Foundation

struct Movie {
    var id: String?
    var poster: String?
    var title: String?
    var releaseDate: Date?
    var rating: Double?
    
    var releaseYear: String {
        releaseDate?.getDateString(format: .year) ?? "N/A"
    }
}
