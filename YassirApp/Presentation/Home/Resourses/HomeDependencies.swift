//
//  HomeDependencies.swift
//  YassirApp
//
//  Created by Elshiekh on 27/10/2023.
//  Copyright (c) 2023. All rights reserved.
//

import UIKit
protocol HomeDependenciesProtocol: CoordinatorDependencyType {
    var navigationController: UINavigationController? { get set }
}

struct HomeDependencies: HomeDependenciesProtocol {
    var navigationController: UINavigationController?
}
