//
//  EndpointsProtocol.swift
//  YassirApp
//
//  Created by Elshiekh on 26/10/2023.
//

import Alamofire

protocol Endpoints {
    func getMethod() -> HTTPMethod
    func getValue() -> String
}
