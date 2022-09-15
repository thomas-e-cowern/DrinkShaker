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
    var strMeasure1: String?
    var strMeasure2: String?
    var strMeasure3: String?
    var strMeasure4: String?
    var strMeasure5: String?
    var strMeasure6: String?
    var strMeasure7: String?
    var strMeasure8: String?
    var strMeasure9: String?
    var strMeasure10: String?
    var strMeasure11: String?
    var strMeasure12: String?
    var strMeasure13: String?
    var strMeasure14: String?
    var strMeasure15: String?
    
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
        if let strIngredient5 = strIngredient5 {
            ingredients.append(strIngredient5)
        }
        if let strIngredient6 = strIngredient6 {
            ingredients.append(strIngredient6)
        }
        if let strIngredient7 = strIngredient7 {
            ingredients.append(strIngredient7)
        }
        if let strIngredient8 = strIngredient8 {
            ingredients.append(strIngredient8)
        }
        if let strIngredient9 = strIngredient9 {
            ingredients.append(strIngredient9)
        }
        if let strIngredient10 = strIngredient10 {
            ingredients.append(strIngredient10)
        }
        if let strIngredient11 = strIngredient11 {
            ingredients.append(strIngredient11)
        }
        if let strIngredient12 = strIngredient12 {
            ingredients.append(strIngredient12)
        }
        if let strIngredient13 = strIngredient13 {
            ingredients.append(strIngredient13)
        }
        if let strIngredient14 = strIngredient14 {
            ingredients.append(strIngredient14)
        }
        if let strIngredient15 = strIngredient15 {
            ingredients.append(strIngredient15)
        }
        
        return ingredients
    }
    
    var measures: [String] {
        var measures: [String] = []
        
        if let strMeasure1 = strMeasure1 {
            measures.append(strMeasure1)
        }
        if let strMeasure2 = strMeasure2{
            measures.append(strMeasure2)
        }
        if let strMeasure3 = strMeasure3 {
            measures.append(strMeasure3)
        }
        if let strMeasure4 = strMeasure4 {
            measures.append(strMeasure4)
        }
        if let strMeasure5 = strMeasure5 {
            measures.append(strMeasure5)
        }
        if let strMeasure6 = strMeasure6 {
            measures.append(strMeasure6)
        }
        
        return measures
    }
    
}

struct Recipes: Codable {
    let drinks: [RecipeModel]
}
