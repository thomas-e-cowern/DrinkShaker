//
//  CocktailDBAPIResponse.swift
//  DrinkShaker
//
//  Created by Thomas Cowern on 2/13/24.
//

import Foundation

struct CocktailDBAPIResponse: Codable {
    let drinks: [Drink]
}
