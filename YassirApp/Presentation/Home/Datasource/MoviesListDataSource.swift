//
//  MoviesListDataSource.swift
//  YassirApp
//
//  Created by Elshiekh on 27/10/2023.
//

import UIKit
protocol MoviesListTableViewDatasourceDelegate: AnyObject {
    func didSelectItem(at index: Int)
}

class MoviesListTableViewDatasource: NSObject {
    var tableView: UITableView
    weak var delegate: MoviesListTableViewDatasourceDelegate?

    private var data: [Movie] = []

    init(tableView: UITableView,
         delegate: MoviesListTableViewDatasourceDelegate?) {
        self.tableView = tableView
        self.delegate = delegate
        super.init()
        setupTableView()
    }

    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(MovieTableViewCell.nib,
                           forCellReuseIdentifier: MovieTableViewCell.identifier)
    }

    func reloadData(_ data: [Movie]) {
        self.data = data
        tableView.reloadData()
    }
}

extension MoviesListTableViewDatasource: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        data.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MovieTableViewCell.identifier) as? MovieTableViewCell
        else {
            return UITableViewCell()
        }
        let item = data[indexPath.row]
        cell.configure(imageURLString: item.poster,
                       title: item.title,
                       date: item.releaseYear,
                       rating: "\(item.rating ?? 0) stars")
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        delegate?.didSelectItem(at: indexPath.row)
    }
}
