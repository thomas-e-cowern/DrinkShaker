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
        
        
    }
}
