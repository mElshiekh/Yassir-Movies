//
//  HomeViewModel.swift
//  YassirApp
//
//  Created by Elshiekh on 27/10/2023.
//  Copyright (c) 2023. All rights reserved.
//

import Combine
import Foundation

class HomeViewModel: HomeViewModelProtocol {
    var moviesObserver = CurrentValueSubject<[Movie]?, Never>([])
    var loadingObserver = CurrentValueSubject<Bool, Never>(false)
    var networkErrorObserver = PassthroughSubject<String, Never>()
    var fetchMoviesUseCase: FetchMoviesUseCaseProtocol

    init(service: MoviesServiceProtocol) {
        fetchMoviesUseCase = FetchMoviesUseCase(service: service,
                                                loadingObserver: loadingObserver,
                                                moviesObserver: moviesObserver,
                                                networkErrorObserver: networkErrorObserver)
    }

    func retrieveData() {
        fetchMoviesUseCase.reset()
        fetchMoviesUseCase.execute()
    }

    func loadMore() {
        fetchMoviesUseCase.execute()
    }
}
