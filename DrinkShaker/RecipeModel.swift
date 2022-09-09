//
//  RecipeModel.swift
//  DrinkShaker
//
//  Created by Thomas Cowern on 9/9/22.
//

import Foundation

struct RecipeModel: Codable {
    let strDrink: String
    let strInstructions: String
    let strDrinkThumb: String
}

struct Recipes: Codable {
    let recipes: [RecipeModel]
}
