//
//  Utilities.swift
//  DrinkShaker
//
//  Created by Thomas Cowern on 3/25/24.
//

import Foundation
import SwiftUI

struct DrinkEndpoints {
    
    @State private var apiKey: String
    
    func getApiKey() {
        
        self.apiKey = Bundle.main.infoDictionary?["API_KEY"] as? String ?? "No API Key"
        
        if apiKey != "No API Key" {
            var popularDrinks = "https://www.thecocktaildb.com/api/json/v2/\(apiKey)/popular.php"
            var newestDrinks = "https://www.thecocktaildb.com/api/json/v2/\(apiKey)/latest.php"
            var randomDrinks = "https://www.thecocktaildb.com/api/json/v2/\(apiKey)/random.php"
        }
    }
//    var spiritDetail = "https://www.thecocktaildb.com/api/json/v2/\(apiKey)/search.php?i=\(spiritName)"
}
