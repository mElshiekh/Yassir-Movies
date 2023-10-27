//
//  FetchMoviesUseCasetests.swift
//  YassirAppTests
//
//  Created by Elshiekh on 27/10/2023.
//

import Combine
import XCTest
@testable import YassirApp

final class FetchMoviesUseCasetests: XCTestCase {
    var moviesObserver = CurrentValueSubject<[Movie]?, Never>([])
    var loadingObserver = CurrentValueSubject<Bool, Never>(false)
    var networkErrorObserver = PassthroughSubject<String, Never>()
    var serviceSpy: MoviesServiceProtocol!
    var cancellables = Set<AnyCancellable>()
    var page = -1
    var loadingState = false
    var errorString = ""
    var movies: [Movie]?

    var respSubject: PassthroughSubject<YassirApp.MoviesResponseDTO?, YassirApp.NetworkError>!

    lazy var sut: FetchMoviesUseCaseProtocol = FetchMoviesUseCase(service: serviceSpy,
                                                                  loadingObserver: loadingObserver,
                                                                  moviesObserver: moviesObserver,
                                                                  networkErrorObserver: networkErrorObserver)
    override func setUp() {
        errorString = ""
        page = -1
        movies = nil
        loadingState = false
        respSubject = PassthroughSubject<YassirApp.MoviesResponseDTO?, YassirApp.NetworkError>()
        serviceSpy = ServiceSpy(respSubject: respSubject)
    }

    class ServiceSpy: ServiceType, MoviesServiceProtocol {
        var respSubject: PassthroughSubject<YassirApp.MoviesResponseDTO?, YassirApp.NetworkError>!

        init(respSubject: PassthroughSubject<YassirApp.MoviesResponseDTO?, YassirApp.NetworkError>!) {
            self.respSubject = respSubject
        }

        func getMoviesRequest(object: YassirApp.MoviesRequestDTO) -> PassthroughSubject<YassirApp.MoviesResponseDTO?, YassirApp.NetworkError> {
            return respSubject
        }

        func getMovieDetailsRequest(object: YassirApp.MovieDetailsRequestDTO) -> PassthroughSubject<YassirApp.MovieResponseDTO?, YassirApp.NetworkError> {
            return PassthroughSubject<YassirApp.MovieResponseDTO?, YassirApp.NetworkError>()
        }
    }

    func testExecuteSuccessfulResponse() {
        // Create mock objects
        let moviesList = [MovieResponseDTO(adult: nil,
                                           backdropPath: nil,
                                           id: 123,
                                           originalLanguage: nil,
                                           originalTitle: nil,
                                           overview: nil,
                                           popularity: nil,
                                           posterPath: nil,
                                           releaseDate: nil,
                                           title: "title",
                                           video: nil,
                                           voteAverage: nil,
                                           voteCount: nil,
                                           genres: nil)]
        let resp = MoviesResponseDTO(page: 1,
                                     results: moviesList,
                                     totalPages: 5,
                                     totalResults: 5)

        moviesObserver.sink { [weak self] movies in
            self?.movies = movies
        }.store(in: &cancellables)

        loadingObserver.sink { [weak self] loading in
            self?.loadingState = loading
        }.store(in: &cancellables)

        // Execute the use case
        sut.execute()
        XCTAssertEqual(loadingState, true)

        respSubject.send(resp)
        XCTAssertEqual(loadingState, false)
        XCTAssertEqual(movies?.first?.id, resp.results.first?.id)
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

    func testReset() {
        let moviesList = [MovieResponseDTO(adult: nil,
                                           backdropPath: nil,
                                           id: 123,
                                           originalLanguage: nil,
                                           originalTitle: nil,
                                           overview: nil,
                                           popularity: nil,
                                           posterPath: nil,
                                           releaseDate: nil,
                                           title: "title",
                                           video: nil,
                                           voteAverage: nil,
                                           voteCount: nil,
                                           genres: nil)]
        let resp = MoviesResponseDTO(page: 1,
                                     results: moviesList,
                                     totalPages: 5,
                                     totalResults: 5)
        
        sut.execute()
        respSubject.send(resp)
        XCTAssertEqual(moviesObserver.value?.count, 1)
        sut.reset()
        XCTAssertEqual(moviesObserver.value?.count, 0)
    }
}
