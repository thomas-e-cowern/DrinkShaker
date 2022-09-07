//
//  Ingredient-CoreDataHelper.swift
//  DrinkShaker
//
//  Created by Thomas Cowern on 9/7/22.
//

import Foundation

extension Ingredient {
    var ingredientName: String {
    name ?? ""
    }
    
    static var example: Ingredient {
        let controller = DataController(inMemory: true)
        let viewContext = controller.container.viewContext
        
        let ingredient = Ingredient(context: viewContext)
        ingredient.name = "Example Ingredient"
        
        return ingredient
    }
}
