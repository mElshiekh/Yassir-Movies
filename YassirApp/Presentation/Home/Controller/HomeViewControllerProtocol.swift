//
//  HomeViewControllerProtocol.swift
//  YassirApp
//
//  Created by Elshiekh on 27/10/2023.
//  Copyright (c) 2023. All rights reserved.
//

import UIKit

protocol HomeViewControllerProtocol: BaseViewController {
    var coordinator: HomeCoordinatorProtocol? { get set }
    var viewModel: HomeViewModelProtocol? { get set }
}
