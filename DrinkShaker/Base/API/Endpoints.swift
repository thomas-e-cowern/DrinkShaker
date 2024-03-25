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
    case spiritDetail(apiKey: String, spiritName: String)
}

extension Endpoints {
    var urlString: String {
        switch self {
        case .popularDrinks(let apiKey):
            return "https://www.thecocktaildb.com/api/json/v2/\(apiKey)/popular.php"
        case .newestDrinks(let apiKey):
            return "https://www.thecocktaildb.com/api/json/v2/\(apiKey)/latest.php"
        case .randomDrink(let apiKey):
            return "https://www.thecocktaildb.com/api/json/v2/\(apiKey)/random.php"
        case .spiritDetail(let apiKey, let spiritName):
            return  "https://www.thecocktaildb.com/api/json/v2/\(apiKey)/search.php?i=\(spiritName)"
        }
    }
}
//extension Endpoints {
//    enum MethodType {
//        case GET
//    }
//}

//extension Endpoints {
//
//    // Base API address
//    var host: String { "https://www.thecocktaildb.com/api/json/v2" }
//
//    var path: String {
//        switch self {
//        case .popularDrinks(let apiKey):
//            return host + "/\(apiKey)/popular.php"
//        case .newestDrinks(let apiKey):
//            return "host + /\(apiKey)/latest.php"
//        case .randomDrink(let apiKey):
//            return host + "/\(apiKey)/random.php"
//        case .spiritDetail(let apiKey, let spiritName):
//            return host + "/\(apiKey)/search.php?i=\(spiritName)"
//        }
//    }
//}

//extension Endpoints {
//
//    var url: URL? {
//        var urlComponents = URLComponents()
//
//        urlComponents.scheme = "https"
//        urlComponents.host = host
//        urlComponents.path = path
//
//        print(urlComponents.url ?? "No URL")
//
//        return urlComponents.url
//    }
//
//    var methodType: MethodType {
//        switch self {
//        case .popularDrinks(let apiKey):
//                return .GET
//        case .newestDrinks(let apiKey):
//            return .GET
//        case .randomDrink(let apiKey):
//            return .GET
//        case .spiritDetail(let apiKey, let spiritName):
//            return .GET
//        }
//    }
//}
