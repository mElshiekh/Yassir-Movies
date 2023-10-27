//
//  HomeViewController.swift
//  YassirApp
//
//  Created by Elshiekh on 27/10/2023.
//  Copyright (c) 2023. All rights reserved.
//

import Combine
import UIKit

class HomeViewController: BaseViewController, HomeViewControllerProtocol {
    @IBOutlet var listTableView: UITableView!

    var coordinator: HomeCoordinatorProtocol?
    var viewModel: HomeViewModelProtocol?
    private var cancellables = Set<AnyCancellable>()
    var listDatasource: MoviesListTableViewDatasource?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        bindData()
    }

    deinit {
        AppCoordinator.shared.currentCoordinators.removeAll(where: { $0 == coordinator })
    }
}

private extension HomeViewController {
    func setupUI() {
        listDatasource = MoviesListTableViewDatasource(tableView: listTableView,
                                                       delegate: self)
    }

    func bindData() {
    }
}

extension HomeViewController: MoviesListTableViewDatasourceDelegate {
    func didSelectItem(at index: Int) {
        print(index)
    }
}
