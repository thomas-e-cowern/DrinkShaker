//
//  DataController.swift
//  DrinkShaker
//
//  Created by Thomas Cowern on 9/6/22.
//

import Foundation
import CoreData
import SwiftUI

class DataController: ObservableObject {
    let container: NSPersistentCloudKitContainer
    
    init(inMemory: Bool = false) {
        container = NSPersistentCloudKitContainer(name: "Main")
        
        // Sample data stored only in RAM
        if inMemory {
            container.persistentStoreDescriptions.first?.url = URL(fileURLWithPath: "/dev/null")
        }
        
        container.loadPersistentStores { storeDescription, error in
            if let error = error {
                fatalError("Fatal error loading store: \(error.localizedDescription)")
            }
        }
    }
    
    func createSampleData() throws {
        let viewContext = container.viewContext
        
        let sampleRecipes = ["Martini", "Rum and coke", "Manhattan", "Old Fashioned", "Bahama Mama"]
        let sampleIndgredients = ["Vodka", "Cherries", "Tripe Sec", "Soda Water", "Ice"]
        
        for i in 1...5 {
            let recipe = Recipe(context: viewContext)
            recipe.title = sampleRecipes[i]
            recipe.glass = "Glass"
            recipe.instructions = "Place all ingreients in a shaker and shake well.  Serve in recommended glass with ice"
            recipe.favorite = Bool.random()
            
            for _ in 1...10 {
                let ingredients = Ingredient(context: viewContext)
                ingredients.ingredient = sampleIndgredients.randomElement()
                ingredients.recipe = recipe
            }
        }
        
        try viewContext.save()
    }
}
