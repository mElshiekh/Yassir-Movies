//
//  MoviesEndPoints.swift
//  YassirApp
//
//  Created by Elshiekh on 27/10/2023.
//  Copyright (c) 2023. All rights reserved.
//

import Alamofire

enum MoviesEndpoints: Endpoints {
    case discover
    case details(id: String)

    func getMethod() -> HTTPMethod {
        switch self {
        case .discover: return .get
        case .details: return .get
        }
    }

    func getValue() -> String {
        switch self {
        case .discover:
            return "discover/movie"
        case .details(id: let id):
            return "movie/\(id)"
        }
    }
}
