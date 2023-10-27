//
//  MovieDetailsCoordinatorProtocol.swift
//  YassirApp
//
//  Created by Elshiekh on 27/10/2023.
//  Copyright (c) 2023. All rights reserved.
//

import Combine
import UIKit

protocol MovieDetailsCoordinatorProtocol: BaseCoordinator {
    func start(model: MovieDetailsDependenciesProtocol,
               callBack: PassthroughSubject<MovieDetailsCoordinatorCallback, Never>) -> UIViewController
    
    var controller: MovieDetailsViewControllerProtocol? { get set }
    var navigationController: UINavigationController? { get set }
    var callBack: PassthroughSubject<MovieDetailsCoordinatorCallback, Never>? { get set }
    
}
