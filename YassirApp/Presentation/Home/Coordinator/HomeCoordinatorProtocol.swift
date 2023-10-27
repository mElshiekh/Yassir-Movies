//
//  HomeCoordinatorProtocol.swift
//  YassirApp
//
//  Created by Elshiekh on 27/10/2023.
//  Copyright (c) 2023. All rights reserved.
//

import Combine
import UIKit

protocol HomeCoordinatorProtocol: BaseCoordinator {
    func start(model: HomeDependenciesProtocol,
               callBack: PassthroughSubject<HomeCoordinatorCallback, Never>) -> UIViewController
    
    var controller: HomeViewControllerProtocol? { get set }
    var navigationController: UINavigationController? { get set }
    var callBack: PassthroughSubject<HomeCoordinatorCallback, Never>? { get set }
    func goToDetailsScreen(id: Int)
}
