//
//  Recipe-CoreDataHelper.swift
//  DrinkShaker
//
//  Created by Thomas Cowern on 9/7/22.
//

import Foundation

extension Recipe {
    var recipeName: String {
        name ?? "New Recipe"
    }
    
    var recipeInstruction: String {
        instructions ?? "Instructions go here"
    }
    
    var recipeGlass: String {
        glass ?? "Glass goes here"
    }
    
    static var example: Recipe {
        let controller = DataController(inMemory: true)
        let viewContext = controller.container.viewContext
        
        let recipe = Recipe(context: viewContext)
        recipe.name = "Example Recipe"
        recipe.instructions = "Recipe Instructions"
        recipe.dateAdded = Date()
        recipe.glass = "Recipe Glass"
        recipe.ingredient = ["Ice", "Liquor", "Fruit"]
        recipe.favorite = true
        
        return recipe
    }
    
    var recipeIngredients: [Ingredient] {
        let ingredientsArray = ingredient?.allObjects as? [Ingredient] ?? []
        return ingredientsArray.sorted { first, second in
            return first.ingredientName < second.ingredientName
        }
    }
}
