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
}

struct Recipes: Codable {
    let drinks: [RecipeModel]
}

//struct IngredientsToArray: CodingKey {
//    var stringValue: String
//    var intValue: Int?
//    
//    init?(stringValue: String) {
//        self.stringValue = stringValue
//        self.intValue = nil
//    }
//    
//    init?(intValue: Int) {
//        self.stringValue = String(intValue)
//        self.intValue = intValue
//    }
//    
//    init(CodingKey: CodingKey) {
//        
//    }
//    
//}
