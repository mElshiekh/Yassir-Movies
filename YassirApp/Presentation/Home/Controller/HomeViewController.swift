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
        viewModel?.retrieveData()
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
        viewModel?.loadingObserver.sink(receiveValue: { [weak self] loading in
            if loading {
                self?.showLoader()
            } else {
                self?.hideLoader()
            }
        }).store(in: &cancellables)
        viewModel?.moviesObserver.sink(receiveValue: { [weak self] movies in
            self?.listDatasource?.reloadData(movies ?? [])
        }).store(in: &cancellables)
        viewModel?.networkErrorObserver.sink(receiveValue: { [weak self] message in
            self?.coordinator?.showMessageAlert(title: "Network error", message: message, action: nil)
        }).store(in: &cancellables)
    }
}

extension HomeViewController: MoviesListTableViewDatasourceDelegate {
    func shouldLoadMore() {
        viewModel?.loadMore()
    }
    
    func didSelectItem(at index: Int) {
        print(index)
    }
}
