//
//  HomeCoordinator.swift
//  YassirApp
//
//  Created by Elshiekh on 27/10/2023.
//  Copyright (c) 2023. All rights reserved.
//

import Combine
import UIKit

class HomeCoordinator: BaseCoordinator, HomeCoordinatorProtocol {
    weak var controller: HomeViewControllerProtocol?
    var callBack: PassthroughSubject<HomeCoordinatorCallback, Never>?

    func start(model: HomeDependenciesProtocol,
               callBack: PassthroughSubject<HomeCoordinatorCallback, Never>) -> UIViewController {
        self.callBack = callBack
        navigationController = model.navigationController
        let viewModel = HomeViewModel()
        let controller = HomeViewController.loadFromNib()
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
