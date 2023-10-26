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
    }
}
