//
//  Utilities.swift
//  DrinkShaker
//
//  Created by Thomas Cowern on 2/16/24.
//

import Foundation

func stringDateToDate(stringDate: String) -> Date {
    let dateFormatter = DateFormatter()
    let date = dateFormatter.date(from: stringDate)
    print("Date: \(dateFormatter)")
    if let date = date {
        return date
    }
    return Date.now
}
