//
//  AppCoordinator.swift
//  YassirApp
//
//  Created by Elshiekh on 26/10/2023.
//

import Combine
import UIKit

class AppCoordinator: AppCoordinatorProtocol {
    static var shared: AppCoordinatorProtocol = AppCoordinator()
    var currentCoordinators: [BaseCoordinator] = []
    var window: UIWindow? {
        didSet {
            guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
            appDelegate.window = window
        }
    }

    func start() {
        let navigationController = UINavigationController()
        let coordinator = HomeCoordinator()
        let callBack = PassthroughSubject<HomeCoordinatorCallback, Never>()
        let controller = coordinator.start(model: HomeDependencies(navigationController: navigationController),
                                           callBack: callBack)
        navigationController.viewControllers = [controller]
        window = UIWindow()
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
}
