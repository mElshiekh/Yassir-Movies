//
//  StaticDataManager.swift
//  YassirApp
//
//  Created by Elshiekh on 27/10/2023.
//

import Foundation

struct StaticDataManager {
    static var shared: StaticDataManager = StaticDataManager()
    private init() {}

    private var bundle: Bundle {
        return Bundle.main
    }
    
    var baseURL: String {
        bundle.object(forInfoDictionaryKey: "base_url") as? String ?? ""
    }
    
    var apiKey: String {
        bundle.object(forInfoDictionaryKey: "api_key") as? String ?? ""
    }
    
    var imageBaseURL: String {
        bundle.object(forInfoDictionaryKey: "image_base_url") as? String ?? ""
    }
    
}
