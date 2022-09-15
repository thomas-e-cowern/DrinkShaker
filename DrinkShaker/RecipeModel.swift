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
    
    var ingredientsAndMeasures: [String] {
        var ingredientsAndMeasures: [String] = []
        
        let result1: String? = combineIngredientsAndMeasures(ingredient: strIngredient1, measure: strMeasure1)
        let result2: String? = combineIngredientsAndMeasures(ingredient: strIngredient2, measure: strMeasure2)
        let result3: String? = combineIngredientsAndMeasures(ingredient: strIngredient3, measure: strMeasure3)
        let result4: String? = combineIngredientsAndMeasures(ingredient: strIngredient4, measure: strMeasure4)
        let result5: String? = combineIngredientsAndMeasures(ingredient: strIngredient5, measure: strMeasure5)
        let result6: String? = combineIngredientsAndMeasures(ingredient: strIngredient6, measure: strMeasure6)
        let result7: String? = combineIngredientsAndMeasures(ingredient: strIngredient7, measure: strMeasure7)
        let result8: String? = combineIngredientsAndMeasures(ingredient: strIngredient8, measure: strMeasure8)
        let result9: String? = combineIngredientsAndMeasures(ingredient: strIngredient9, measure: strMeasure9)
        let result10: String? = combineIngredientsAndMeasures(ingredient: strIngredient10, measure: strMeasure10)
        let result11: String? = combineIngredientsAndMeasures(ingredient: strIngredient11, measure: strMeasure11)
        let result12: String? = combineIngredientsAndMeasures(ingredient: strIngredient12, measure: strMeasure12)
        let result13: String? = combineIngredientsAndMeasures(ingredient: strIngredient13, measure: strMeasure12)
        let result14: String? = combineIngredientsAndMeasures(ingredient: strIngredient14, measure: strMeasure14)
        let result15: String? = combineIngredientsAndMeasures(ingredient: strIngredient15, measure: strMeasure15)
        
        if let result1 = result1 {
            ingredientsAndMeasures.append(result1)
        }
        if let result2 = result2 {
            ingredientsAndMeasures.append(result2)
        }
        if let result3 = result3 {
            ingredientsAndMeasures.append(result3)
        }
        if let result4 = result4 {
            ingredientsAndMeasures.append(result4)
        }
        if let result5 = result5 {
            ingredientsAndMeasures.append(result5)
        }
        if let result6 = result6 {
            ingredientsAndMeasures.append(result6)
        }
        if let result7 = result7 {
            ingredientsAndMeasures.append(result7)
        }
        if let result8 = result8 {
            ingredientsAndMeasures.append(result8)
        }
        if let result9 = result9 {
            ingredientsAndMeasures.append(result9)
        }
        if let result10 = result10 {
            ingredientsAndMeasures.append(result10)
        }
        if let result11 = result11 {
            ingredientsAndMeasures.append(result11)
        }
        if let result12 = result12 {
            ingredientsAndMeasures.append(result12)
        }
        if let result13 = result13 {
            ingredientsAndMeasures.append(result13)
        }
        if let result14 = result14 {
            ingredientsAndMeasures.append(result14)
        }
        if let result15 = result15 {
            ingredientsAndMeasures.append(result15)
        }
        
        return ingredientsAndMeasures.filter {
            !$0.isEmpty
        }
    }

    func combineIngredientsAndMeasures (ingredient: String?, measure: String?) -> String {
        
        var combinedString = ""
        
        if let measure = measure {
            combinedString += measure
        }
        
        if let ingredient = ingredient {
            combinedString += " \(ingredient)"
        }
        
        print(combinedString)
        return combinedString
    }
}

struct Recipes: Codable {
    let drinks: [RecipeModel]
}
