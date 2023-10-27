//
//  FetchMoviesUseCase.swift
//  YassirApp
//
//  Created by Elshiekh on 27/10/2023.
//

import Combine
import Foundation

class FetchMoviesUseCase: FetchMoviesUseCaseProtocol {
    private var currentPage: UInt = 0
    private var totalPages: UInt = UInt.max

    private var service: MoviesServiceProtocol

    private var loadingObserver: CurrentValueSubject<Bool, Never>
    private var moviesObserver: CurrentValueSubject<[Movie]?, Never>
    private var networkErrorObserver: PassthroughSubject<String, Never>
    private var cancellables = Set<AnyCancellable>()

    init(service: MoviesServiceProtocol,
         loadingObserver: CurrentValueSubject<Bool, Never>,
         moviesObserver: CurrentValueSubject<[Movie]?, Never>,
         networkErrorObserver: PassthroughSubject<String, Never>) {
        self.service = service
        self.loadingObserver = loadingObserver
        self.moviesObserver = moviesObserver
        self.networkErrorObserver = networkErrorObserver
    }

    func execute() {
        if loadingObserver.value == false,
           currentPage < totalPages {
            loadingObserver.send(true)
            currentPage += 1
            service.getMoviesRequest(object: MoviesRequestDTO(page: currentPage))
                .sink(receiveCompletion: { [weak self] completion in
                    self?.loadingObserver.send(false)
                    switch completion {
                    case .finished:
                        break
                    case let .failure(error):
                        switch error.type {
                        case .noInternet:
                            self?.networkErrorObserver.send("no internet")
                        case .serverError:
                            self?.networkErrorObserver.send("Server error")
                        case .unauthorized:
                            print("logout")
                        }
                    }
                }, receiveValue: { [weak self] resp in
                    guard let self = self else { return }
                    self.loadingObserver.send(false)
                    let movies = resp?.results.compactMap({ $0.toDomain() }) ?? []
                    var allMovies = self.moviesObserver.value ?? []
                    allMovies.append(contentsOf: movies)
                    self.moviesObserver.send(allMovies)
                }).store(in: &cancellables)
        }
    }

    func reset() {
        currentPage = 0
        totalPages = UInt.max
        moviesObserver.value = []
    }
}
