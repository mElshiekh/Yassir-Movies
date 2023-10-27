//
//  ServiceType.swift
//  YassirApp
//
//  Created by Elshiekh on 26/10/2023.
//

import Foundation

class ServiceType {
    var networkManager = NetworkManager.shared
    var baseURL: String {
        StaticDataManager.shared.baseURL
    }

    var apiKey: String {
        StaticDataManager.shared.apiKey
    }

    func getFullURL(baseUrl: String,
                    endPoint: String,
                    parameters: [String: Any]? = nil) -> String {
        let urlString = "\(baseUrl)\(endPoint)"
        var components = URLComponents()
        components.path = urlString
        components.queryItems = []
        if let params = parameters {
            for key in params.keys where params[key] != nil {
                components.queryItems?.append(URLQueryItem(name: key, value: "\(params[key] ?? "")"))
            }
            return (components.url?.absoluteString.removingPercentEncoding?.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? urlString)
        }
        return urlString
    }
}

extension ServiceType {
    func getFullURL(endPoint: Endpoints,
                    parameters: [String: Any]? = nil,
                    includeAPIKey: Bool = true) -> String {
        var params = parameters
        if includeAPIKey {
            params = params ?? [:]
            params?["api_key"] = apiKey
        }
        return getFullURL(baseUrl: baseURL,
                          endPoint: endPoint.getValue(),
                          parameters: params)
    }
}
