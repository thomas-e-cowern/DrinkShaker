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
    let id: String
    let ingredientName: String
    let ingredientDescrtiption: String?
    let ingredientType: String
    let ingredientContainsAlcohol: String
    let alcoholByVolume: String?

    enum CodingKeys: String, CodingKey {
        case id = "idIngredient"
        case ingredientName = "strIngredient"
        case ingredientDescrtiption = "strDescription"
        case ingredientType = "strType"
        case ingredientContainsAlcohol = "strAlcohol"
        case alcoholByVolume = "strABV"
    }
}
