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
    
    static var preview: DataController = {
        let dataController = DataController(inMemory: true)
        let viewContext = dataController.container.viewContext
        
        do {
            try dataController.createSampleData()
        } catch {
            fatalError("Fatal error creating preview: \(error.localizedDescription)")
        }
        
        return dataController
    }()
    
    // Sample data for development
    func createSampleData() throws {
        let viewContext = container.viewContext
        
        let sampleRecipes = ["Martini", "Rum and coke", "Manhattan", "Old Fashioned", "Bahama Mama"]
        let sampleIndgredients = ["Vodka", "Cherries", "Tripe Sec", "Soda Water", "Ice"]
        
        for _ in 1...5 {
            let recipe = Recipe(context: viewContext)
            recipe.name = sampleRecipes.randomElement()
            recipe.glass = "Glass"
            recipe.instructions = "Place all ingreients in a shaker and shake well.  Serve in recommended glass with ice"
            recipe.favorite = Bool.random()
            
            for _ in 1...5 {
                let ingredients = Ingredient(context: viewContext)
                ingredients.name = sampleIndgredients.randomElement()
                ingredients.recipe = recipe
            }
        }
        
        try viewContext.save()
    }
    
    // Save only if there have been changes
    func save() {
        if container.viewContext.hasChanges {
            try? container.viewContext.save()
        }
    }
    
    // Delete method
    func delete(_ object: NSManagedObject) {
        container.viewContext.delete(object)
    }
    
    // Delete all sample data after fetching
    func deleteAll() {
        let fetchRequestIngredients: NSFetchRequest<NSFetchRequestResult> = Ingredient.fetchRequest()
        let batchDeleteRequestIngredients = NSBatchDeleteRequest(fetchRequest: fetchRequestIngredients)
        _ = try? container.viewContext.execute(batchDeleteRequestIngredients)
        
        let fetchRequestRecipe: NSFetchRequest<NSFetchRequestResult> = Recipe.fetchRequest()
        let batchDeleteRequestRecipe = NSBatchDeleteRequest(fetchRequest: fetchRequestRecipe)
        _ = try? container.viewContext.execute(batchDeleteRequestRecipe)
    }
}
