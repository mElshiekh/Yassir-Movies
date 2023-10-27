//
//  MovieDetailsViewModelProtocol.swift
//  YassirApp
//
//  Created by Elshiekh on 27/10/2023.
//  Copyright (c) 2023. All rights reserved.
//

import Foundation
import Combine

protocol MovieDetailsViewModelProtocol: AnyObject {
    var movieObserver: PassthroughSubject<MovieDetails?, Never> { get set }
    var loadingObserver: PassthroughSubject<Bool, Never> { get set }
    var networkErrorObserver: PassthroughSubject<String, Never> { get set }
    func retrieveData()
}
