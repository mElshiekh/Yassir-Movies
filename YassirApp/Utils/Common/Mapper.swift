//
//  Mapper.swift
//  YassirApp
//
//  Created by Elshiekh on 27/10/2023.
//

import Foundation

protocol Mapper {
    associatedtype Item
    func toDomain() -> Item
}
