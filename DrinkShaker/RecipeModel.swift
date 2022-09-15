//
//  RecipeModel.swift
//  DrinkShaker
//
//  Created by Thomas Cowern on 9/9/22.
//

import Foundation

struct RecipeModel: Codable {
    var idDrink: String
    var strDrink: String
    var strInstructions: String
    var strDrinkThumb: String?
    var strCategory: String
    var strGlass: String
    var strIngredient1: String?
    var strIngredient2: String?
    var strIngredient3: String?
    var strIngredient4: String?
    var strIngredient5: String?
    var strIngredient6: String?
    var strIngredient7: String?
    var strIngredient8: String?
    var strIngredient9: String?
    var strIngredient10: String?
    var strIngredient11: String?
    var strIngredient12: String?
    var strIngredient13: String?
    var strIngredient14: String?
    var strIngredient15: String?
    
    var ingredients: [String] {
        var ingredients: [String] = []
        
        if let strIngredient1 = strIngredient1 {
            ingredients.append(strIngredient1)
        }
        if let strIngredient2 = strIngredient2 {
            ingredients.append(strIngredient2)
        }
        if let strIngredient3 = strIngredient3 {
            ingredients.append(strIngredient3)
        }
        if let strIngredient4 = strIngredient4 {
            ingredients.append(strIngredient4)
        }
        
        return ingredients
    }
    
}

struct Recipes: Codable {
    let drinks: [RecipeModel]
}
