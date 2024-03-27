//
//  Endpoints.swift
//  DrinkShaker
//
//  Created by Thomas Cowern on 3/25/24.
//

import Foundation

enum Endpoints {
    case popularDrinks(apiKey: String)
    case newestDrinks(apiKey: String)
    case randomDrink(apiKey: String)
    case spiritDetail(apiKey: String, searchTerm: String)
    case drinkOfTheDayDetail(apiKey: String, searchTerm: String)
}

extension Endpoints {
    var url: URL {
        switch self {
        case .popularDrinks(let apiKey):
            return URL(string: "https://www.thecocktaildb.com/api/json/v2/\(apiKey)/popular.php")!
        case .newestDrinks(let apiKey):
            return URL(string: "https://www.thecocktaildb.com/api/json/v2/\(apiKey)/latest.php")!
        case .randomDrink(let apiKey):
            return URL(string: "https://www.thecocktaildb.com/api/json/v2/\(apiKey)/random.php")!
        case .spiritDetail(let apiKey, let searchTerm):
            return URL(string: "https://www.thecocktaildb.com/api/json/v2/\(apiKey)/search.php?i=\(searchTerm)")!
        case .drinkOfTheDayDetail(let apiKey, let searchTerm):
            return URL(string: "https://www.thecocktaildb.com/api/json/v2/\(apiKey)/search.php?i=\(searchTerm)")!
        }
    }
}
