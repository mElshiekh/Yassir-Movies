//
//  MovieDetailsViewModel.swift
//  YassirApp
//
//  Created by Elshiekh on 27/10/2023.
//  Copyright (c) 2023. All rights reserved.
//

import Combine
import Foundation

class MovieDetailsViewModel: MovieDetailsViewModelProtocol {
    var movieObserver = PassthroughSubject<MovieDetails?, Never>()
    var loadingObserver = PassthroughSubject<Bool, Never>()
    var networkErrorObserver = PassthroughSubject<String, Never>()
    private var fetchMovieDetailsUseCase: FetchMovieDetailsUseCaseProtocol

    init(movieId: Int,
         service: MoviesServiceProtocol) {
        fetchMovieDetailsUseCase = FetchMovieDetailsUseCase(movieId: movieId,
                                                            service: service,
                                                            loadingObserver: loadingObserver,
                                                            movieObserver: movieObserver,
                                                            networkErrorObserver: networkErrorObserver)
    }

    func retrieveData() {
        fetchMovieDetailsUseCase.execute()
    }
}
