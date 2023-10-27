//
//  MovieDetailsCoordinator.swift
//  YassirApp
//
//  Created by Elshiekh on 27/10/2023.
//  Copyright (c) 2023. All rights reserved.
//

import Combine
import UIKit

class MovieDetailsCoordinator: BaseCoordinator, MovieDetailsCoordinatorProtocol {
    weak var controller: MovieDetailsViewControllerProtocol?
    var callBack: PassthroughSubject<MovieDetailsCoordinatorCallback, Never>?

    func start(model: MovieDetailsDependenciesProtocol,
               callBack: PassthroughSubject<MovieDetailsCoordinatorCallback, Never>) -> UIViewController {
        self.callBack = callBack
        navigationController = model.navigationController
        let viewModel = MovieDetailsViewModel(movieId: model.id, service: MoviesService())
        let controller = MovieDetailsViewController.loadFromNib()
        self.controller = controller
        controller.coordinator = self
        controller.viewModel = viewModel
        AppCoordinator.shared.currentCoordinators.append(self)
        return controller
    }

//
//    func goToScreen() {
//        let coordinator = screenCoordinator()
//        let callBack = PassthroughSubject<ScreenCoordinatorCallback, Never>()
//        callBack.sink(receiveValue: { value in
//                switch value {
//                case .closed:
//                    break
//                }
//        }).store(in: &cancellables)
//        let controller = coordinator.start(model: ScreenCoordinatorModel(navigationController: navigationController),
//                                           callBack: callBack)
//        navigationController?.pushViewController(controller, animated: true)
//    }

    deinit {
        callBack?.send(.closed)
    }
}
