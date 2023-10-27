//
//  MovieDetailsViewControllerProtocol.swift
//  YassirApp
//
//  Created by Elshiekh on 27/10/2023.
//  Copyright (c) 2023. All rights reserved.
//

import UIKit

protocol MovieDetailsViewControllerProtocol: BaseViewController {
    var coordinator: MovieDetailsCoordinatorProtocol? { get set }
    var viewModel: MovieDetailsViewModelProtocol? { get set }
}
