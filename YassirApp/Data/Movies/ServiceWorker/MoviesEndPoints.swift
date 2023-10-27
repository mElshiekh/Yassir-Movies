//
//  MoviesEndPoints.swift
//  YassirApp
//
//  Created by Elshiekh on 27/10/2023.
//  Copyright (c) 2023. All rights reserved.
//

import Alamofire

enum MoviesEndpoints: String, Endpoints {
    case request

    func getMethod() -> HTTPMethod {
        switch self {
        case .request: return .get
        }
    }

    func getValue() -> String {
        switch self {
        case .request: return ""
        }
    }
}
