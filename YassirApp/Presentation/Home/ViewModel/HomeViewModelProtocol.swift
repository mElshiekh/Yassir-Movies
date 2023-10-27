//
//  HomeViewModelProtocol.swift
//  YassirApp
//
//  Created by Elshiekh on 27/10/2023.
//  Copyright (c) 2023. All rights reserved.
//

import Foundation
import Combine

protocol HomeViewModelProtocol: AnyObject {
    var moviesObserver: CurrentValueSubject<[Movie]?, Never> { get set }
    var loadingObserver: CurrentValueSubject<Bool, Never> { get set }
    var networkErrorObserver: PassthroughSubject<String, Never> { get set }
    func retrieveData()
    func loadMore()
    func getIDFor(index: Int) -> Int?
}
