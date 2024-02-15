//
//  Drink.swift
//  DrinkShaker
//
//  Created by Thomas Cowern on 2/13/24.
//

import Foundation

struct Drink: Codable {
    let id: String
    let name: String
    let glass: String
    let alcohol: String
    let instructions: String
    let image: String
    let ingredient1: String?
    let ingredient2: String?
    let ingredient3: String?
    let ingredient4: String?
    let ingredient5: String?
    let ingredient6: String?
    let ingredient7: String?
    let ingredient8: String?
    let ingredient9: String?
    let ingredient10: String?
    let ingredient11: String?
    let ingredient12: String?
    let ingredient13: String?
    let ingredient14: String?
    let ingredient15: String?
    let measure1: String?
    let measure2: String?
    let measure3: String?
    let measure4: String?
    let measure5: String?
    let measure6: String?
    let measure7: String?
    let measure8: String?
    let measure9: String?
    let measure10: String?
    let measure11: String?
    let measure12: String?
    let measure13: String?
    let measure14: String?
    let measure15: String?
    let imageSource: String?
    let imageAttribute: String?
    let creativeCommonsConfirmed: String?
    let dateModified: String?
    
    enum CodingKeys: String, CodingKey {
        case id = "idDrink"
        case name = "strDrink"
        case glass = "strGlass"
        case alcohol = "strAlcoholic"
        case instructions = "strInstructions"
        case image = "strDrinkThumb"
        case ingredient1 = "strIngredient1"
        case ingredient2 = "strIngredient2"
        case ingredient3 = "strIngredient3"
        case ingredient4 = "strIngredient4"
        case ingredient5 = "strIngredient5"
        case ingredient6 = "strIngredient6"
        case ingredient7 = "strIngredient7"
        case ingredient8 = "strIngredient8"
        case ingredient9 = "strIngredient9"
        case ingredient10 = "strIngredient10"
        case ingredient11 = "strIngredient11"
        case ingredient12 = "strIngredient12"
        case ingredient13 = "strIngredient13"
        case ingredient14 = "strIngredient14"
        case ingredient15 = "strIngredient15"
        case measure1 = "strMeasure1"
        case measure2 = "strMeasure2"
        case measure3 = "strMeasure3"
        case measure4 = "strMeasure4"
        case measure5 = "strMeasure5"
        case measure6 = "strMeasure6"
        case measure7 = "strMeasure7"
        case measure8 = "strMeasure8"
        case measure9 = "strMeasure9"
        case measure10 = "strMeasure10"
        case measure11 = "strMeasure11"
        case measure12 = "strMeasure12"
        case measure13 = "strMeasure13"
        case measure14 = "strMeasure14"
        case measure15 = "strMeasure15"
        case imageSource = "strImageSource"
        case imageAttribute = "strImageAttribution"
        case creativeCommonsConfirmed = "strCreativeCommonsConfirmed"
        case dateModified = "dateModified"
    }
    
    var ingredientsAndMeasures: [String] {
        var ingredientsAndMeasures: [String] = []
        
        let result1: String? = combineIngredientsAndMeasures(ingredient: ingredient1, measure: measure1)
        let result2: String? = combineIngredientsAndMeasures(ingredient: ingredient2, measure: measure2)
        let result3: String? = combineIngredientsAndMeasures(ingredient: ingredient3, measure: measure3)
        let result4: String? = combineIngredientsAndMeasures(ingredient: ingredient4, measure: measure4)
        let result5: String? = combineIngredientsAndMeasures(ingredient: ingredient5, measure: measure5)
        let result6: String? = combineIngredientsAndMeasures(ingredient: ingredient6, measure: measure6)
        let result7: String? = combineIngredientsAndMeasures(ingredient: ingredient7, measure: measure7)
        let result8: String? = combineIngredientsAndMeasures(ingredient: ingredient8, measure: measure8)
        let result9: String? = combineIngredientsAndMeasures(ingredient: ingredient9, measure: measure9)
        let result10: String? = combineIngredientsAndMeasures(ingredient: ingredient10, measure: measure10)
        let result11: String? = combineIngredientsAndMeasures(ingredient: ingredient11, measure: measure11)
        let result12: String? = combineIngredientsAndMeasures(ingredient: ingredient12, measure: measure12)
        let result13: String? = combineIngredientsAndMeasures(ingredient: ingredient13, measure: measure12)
        let result14: String? = combineIngredientsAndMeasures(ingredient: ingredient14, measure: measure14)
        let result15: String? = combineIngredientsAndMeasures(ingredient: ingredient15, measure: measure15)
        
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


