//
//  AppCoordinatorProtocol.swift
//  YassirApp
//
//  Created by Elshiekh on 26/10/2023.
//

import Foundation

protocol AppCoordinatorProtocol {
    var currentCoordinators: [BaseCoordinator] { get set }
    func start()
}
