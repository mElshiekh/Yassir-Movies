//
//  MoviesServiceProtocol.swift
//  YassirApp
//
//  Created by Elshiekh on 27/10/2023.
//  Copyright (c) 2023. All rights reserved.
//

import Combine

protocol MoviesServiceProtocol: ServiceType {
    func MoviesRequest(object: MoviesRequestDTO) -> PassthroughSubject<MoviesResponseDTO?, NetworkError>
}
