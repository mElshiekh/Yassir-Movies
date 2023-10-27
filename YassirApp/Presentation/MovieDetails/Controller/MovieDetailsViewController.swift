//
//  MovieDetailsViewController.swift
//  YassirApp
//
//  Created by Elshiekh on 27/10/2023.
//  Copyright (c) 2023. All rights reserved.
//

import Combine
import UIKit

class MovieDetailsViewController: BaseViewController, MovieDetailsViewControllerProtocol {
    @IBOutlet var holdingView: UIView!
    @IBOutlet var posterImageView: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var genreLabel: UILabel!
    @IBOutlet var releaseDateLabel: UILabel!
    @IBOutlet var ratingLabel: UILabel!
    @IBOutlet var overviewLabel: UILabel!

    var coordinator: MovieDetailsCoordinatorProtocol?
    var viewModel: MovieDetailsViewModelProtocol?
    private var cancellables = Set<AnyCancellable>()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        bindData()
        viewModel?.retrieveData()
    }

    deinit {
        AppCoordinator.shared.currentCoordinators.removeAll(where: { $0 == coordinator })
    }
}

private extension MovieDetailsViewController {
    func setupUI() {
        holdingView.layer.cornerRadius = 12
        holdingView.clipsToBounds = true
    }

    func bindData() {
        viewModel?.loadingObserver.sink(receiveValue: { [weak self] loading in
            if loading {
                self?.showLoader()
            } else {
                self?.hideLoader()
            }
        }).store(in: &cancellables)
        viewModel?.movieObserver.sink(receiveValue: { [weak self] movie in
            if let movie = movie {
                self?.setupData(movie: movie)
            }
        }).store(in: &cancellables)
        viewModel?.networkErrorObserver.sink(receiveValue: { [weak self] message in
            self?.coordinator?.showMessageAlert(title: "Network error", message: message, action: nil)
        }).store(in: &cancellables)
    }

    func setupData(movie: MovieDetails) {
        if let poster = movie.poster {
            let  posterURL = URL(string: poster)
            posterImageView.setImage(from: posterURL)
        }
        titleLabel.text = movie.title
        genreLabel.text = movie.genres
        releaseDateLabel.text = movie.releaseYear
        ratingLabel.text = "\(movie.rating ?? 0)"
        overviewLabel.text = movie.overview
    }
}
