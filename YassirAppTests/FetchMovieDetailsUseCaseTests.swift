//
//  FetchMovieDetailsUseCaseTests.swift
//  YassirAppTests
//
//  Created by Elshiekh on 27/10/2023.
//

import Combine
import XCTest
@testable import YassirApp

final class FetchMovieDetailsUseCaseTests: XCTestCase {
    var movieObserver = PassthroughSubject<MovieDetails?, Never>()
    var loadingObserver = PassthroughSubject<Bool, Never>()
    var networkErrorObserver = PassthroughSubject<String, Never>()
    var serviceSpy: MoviesServiceProtocol!
    var cancellables = Set<AnyCancellable>()
    let movieId = 123
    var loadingState = false
    var errorString = ""
    var id = -1

    var respSubject: PassthroughSubject<YassirApp.MovieResponseDTO?, YassirApp.NetworkError>!

    lazy var sut: FetchMovieDetailsUseCaseProtocol = FetchMovieDetailsUseCase(movieId: movieId,
                                                                              service: serviceSpy,
                                                                              loadingObserver: loadingObserver,
                                                                              movieObserver: movieObserver,
                                                                              networkErrorObserver: networkErrorObserver)
    override func setUp() {
        errorString = ""
        id = -1
        loadingState = false
        respSubject = PassthroughSubject<YassirApp.MovieResponseDTO?, YassirApp.NetworkError>()
        serviceSpy = ServiceSpy(respSubject: respSubject)
    }

    class ServiceSpy: ServiceType, MoviesServiceProtocol {
        var respSubject: PassthroughSubject<YassirApp.MovieResponseDTO?, YassirApp.NetworkError>!

        init(respSubject: PassthroughSubject<YassirApp.MovieResponseDTO?, YassirApp.NetworkError>!) {
            self.respSubject = respSubject
        }

        func getMoviesRequest(object: YassirApp.MoviesRequestDTO) -> PassthroughSubject<YassirApp.MoviesResponseDTO?, YassirApp.NetworkError> {
            return PassthroughSubject<YassirApp.MoviesResponseDTO?, YassirApp.NetworkError>()
        }

        func getMovieDetailsRequest(object: YassirApp.MovieDetailsRequestDTO) -> PassthroughSubject<YassirApp.MovieResponseDTO?, YassirApp.NetworkError> {
            return respSubject
        }
    }

    func testExecuteSuccessfulResponse() {
        // Create mock objects
        let title = "movie title"
        let resp = MovieResponseDTO(adult: nil,
                                    backdropPath: nil,
                                    id: movieId,
                                    originalLanguage: nil,
                                    originalTitle: nil,
                                    overview: nil,
                                    popularity: nil,
                                    posterPath: nil,
                                    releaseDate: nil,
                                    title: title,
                                    video: nil,
                                    voteAverage: nil,
                                    voteCount: nil,
                                    genres: nil)


        movieObserver.sink { [weak self] movieDetails in
            self?.id = movieDetails?.id ?? -1
        }.store(in: &cancellables)

        loadingObserver.sink { [weak self] loading in
            self?.loadingState = loading
        }.store(in: &cancellables)

        // Execute the use case
        sut.execute()
        XCTAssertEqual(loadingState, true)
        
        respSubject.send(resp)
        XCTAssertEqual(loadingState, false)
        XCTAssertEqual(id, movieId)
    }
    
    func testExecuteFailedResponse() {
        let expectedString = "no internet"
        let error = NetworkError(type: .noInternet, data: nil)
        networkErrorObserver.sink { [weak self] error in
            self?.errorString = error
        }.store(in: &cancellables)
        
        loadingObserver.sink { [weak self] loading in
            self?.loadingState = loading
        }.store(in: &cancellables)

        // Execute the use case
        sut.execute()
        XCTAssertEqual(loadingState, true)
        
        loadingState = false
        respSubject.send(completion: .failure(error))
        XCTAssertEqual(loadingState, false)
        XCTAssertEqual(errorString, expectedString)
    }
}
