//
//  MoviesService.swift
//  YassirApp
//
//  Created by Elshiekh on 27/10/2023.
//  Copyright (c) 2023. All rights reserved.
//

import Alamofire
import Combine

class MoviesService: ServiceType, MoviesServiceProtocol {
    func getMoviesRequest(object: MoviesRequestDTO) -> PassthroughSubject<MoviesResponseDTO?, NetworkError> {
        let endpoint = MoviesEndpoints.request
        let url = getFullURL(endPoint: endpoint,
                             parameters: object.toDictionary)
        return networkManager.processReq(url: url,
                                         method: endpoint.getMethod(),
                                         params: nil,
                                         headers: nil)
    }
}
