//
//  Date+Extensions.swift
//  YassirApp
//
//  Created by Elshiekh on 27/10/2023.
//

import Foundation

extension Date {
    enum DateFormates: String {
        case year = "yyyy"
        case dashedDateFormat = "yyyy-MM-dd"
    }

    init?(from date: String?,
          fromFormate: String = DateFormates.dashedDateFormat.rawValue) {
        guard let date = date else { return nil }
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = fromFormate
        if let date = dateFormatter.date(from: date) {
            self = date
        } else {
            return nil
        }
    }

    func getDateString(format: DateFormates) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format.rawValue
        let dateString = formatter.string(from: self)
        return dateString
    }
}
