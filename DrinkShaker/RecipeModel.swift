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
        
        let result1 = combineIngredientsAndMeasures(ingredient: strIngredient1, measure: strMeasure1)
        let result2 = combineIngredientsAndMeasures(ingredient: strIngredient2, measure: strMeasure2)
        let result3 = combineIngredientsAndMeasures(ingredient: strIngredient3, measure: strMeasure3)
        let result4 = combineIngredientsAndMeasures(ingredient: strIngredient4, measure: strMeasure4)
        let result5 = combineIngredientsAndMeasures(ingredient: strIngredient5, measure: strMeasure5)
        let result6 = combineIngredientsAndMeasures(ingredient: strIngredient6, measure: strMeasure6)
        let result7 = combineIngredientsAndMeasures(ingredient: strIngredient7, measure: strMeasure7)
        print("Result 1: \(result1)")
        print("Result 2: \(result2)")
        print("Result 3: \(result3)")
        print("Result 4: \(result4)")
        print("Result 5: \(result5)")
        print("Result 6: \(result6)")
        print("Result 7: \(result7)")
        if let strIngredient1 = strIngredient1 {
            ingredientsAndMeasures.append(strIngredient1)
        }
        if let strIngredient2 = strIngredient2 {
            ingredientsAndMeasures.append(strIngredient2)
        }
        if let strIngredient3 = strIngredient3 {
            ingredientsAndMeasures.append(strIngredient3)
        }
        if let strIngredient4 = strIngredient4 {
            ingredientsAndMeasures.append(strIngredient4)
        }
        if let strIngredient5 = strIngredient5 {
            ingredientsAndMeasures.append(strIngredient5)
        }
        if let strIngredient6 = strIngredient6 {
            ingredientsAndMeasures.append(strIngredient6)
        }
        if let strIngredient7 = strIngredient7 {
            ingredientsAndMeasures.append(strIngredient7)
        }
        if let strIngredient8 = strIngredient8 {
            ingredientsAndMeasures.append(strIngredient8)
        }
        if let strIngredient9 = strIngredient9 {
            ingredientsAndMeasures.append(strIngredient9)
        }
        if let strIngredient10 = strIngredient10 {
            ingredientsAndMeasures.append(strIngredient10)
        }
        if let strIngredient11 = strIngredient11 {
            ingredientsAndMeasures.append(strIngredient11)
        }
        if let strIngredient12 = strIngredient12 {
            ingredientsAndMeasures.append(strIngredient12)
        }
        if let strIngredient13 = strIngredient13 {
            ingredientsAndMeasures.append(strIngredient13)
        }
        if let strIngredient14 = strIngredient14 {
            ingredientsAndMeasures.append(strIngredient14)
        }
        if let strIngredient15 = strIngredient15 {
            ingredientsAndMeasures.append(strIngredient15)
        }
        
        return ingredientsAndMeasures
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
    
    func combineIngredientsAndMeasures (ingredient: String?, measure: String?) -> String {
        
        var combinedString = ""
        
        if let ingredient = ingredient {
            combinedString += ingredient
        }
        
        if let measure = measure {
            combinedString += " \(measure)"
        }
        print(combinedString)
        return combinedString
    }
}

struct Recipes: Codable {
    let drinks: [RecipeModel]
}
