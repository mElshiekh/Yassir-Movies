//
//  MovieDetailsDependencies.swift
//  YassirApp
//
//  Created by Elshiekh on 27/10/2023.
//  Copyright (c) 2023. All rights reserved.
//

import UIKit
protocol MovieDetailsDependenciesProtocol: CoordinatorDependencyType {
    var id: Int { get set }
}

struct MovieDetailsDependencies: MovieDetailsDependenciesProtocol {
    var navigationController: UINavigationController?
    var id: Int
}
