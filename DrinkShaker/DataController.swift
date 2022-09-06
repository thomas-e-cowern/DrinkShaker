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
        
        for i in 1...5 {
            let recipe = Recipe()
            recipe.title = "Sample Recipe \(i)"
            recipe.glass = "Glass"
            recipe.ingredients = ["Vodka", "Lemons", "Mint", "Ice"]
            recipe.instructions = "Place all ingreients in a shaker and shake well.  Serve in recommended glass with ice"
        }
    }
}
