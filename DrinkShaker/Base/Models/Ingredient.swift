//
//  Ingredients.swift
//  DrinkShaker
//
//  Created by Thomas Cowern on 2/16/24.
//

import Foundation

struct IngredientName: Codable {
    let strIngredient1: String
}


struct IngredientsAPIResponse: Codable {
    let drinks: [IngredientName]
}

struct Ingredients: Codable {
    let ingredients: [Ingredient]
}

struct Ingredient: Codable {
    let idIngredient, strIngredient, strDescription, strType: String
    let strAlcohol: String
    let strABV: String?
}
