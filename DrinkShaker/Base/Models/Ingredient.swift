//
//  Ingredients.swift
//  DrinkShaker
//
//  Created by Thomas Cowern on 2/16/24.
//

import Foundation

struct Ingredient: Codable {
    let strIngredient1: String
}


struct IngredientsAPIResponse: Codable {
    let drinks: [Ingredient]
}
