//
//  FetchMovieDetailsUseCase.swift
//  YassirApp
//
//  Created by Elshiekh on 27/10/2023.
//

import Combine
import Foundation

class FetchMovieDetailsUseCase: FetchMovieDetailsUseCaseProtocol {
    private var movieId: Int
    private var service: MoviesServiceProtocol
    private var loadingObserver: PassthroughSubject<Bool, Never>
    private var movieObserver: PassthroughSubject<MovieDetails?, Never>
    private var networkErrorObserver: PassthroughSubject<String, Never>
    private var cancellables = Set<AnyCancellable>()

    init(movieId: Int,
         service: MoviesServiceProtocol,
         loadingObserver: PassthroughSubject<Bool, Never>,
         movieObserver: PassthroughSubject<MovieDetails?, Never>,
         networkErrorObserver: PassthroughSubject<String, Never>) {
        self.movieId = movieId
        self.service = service
        self.loadingObserver = loadingObserver
        self.movieObserver = movieObserver
        self.networkErrorObserver = networkErrorObserver
    }

    func execute() {
        loadingObserver.send(true)
        let id = "\(movieId)"
        service.getMovieDetailsRequest(object: MovieDetailsRequestDTO(id: id))
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
                self.movieObserver.send(resp?.toDetailsDomain())
            }).store(in: &cancellables)
    }
}
