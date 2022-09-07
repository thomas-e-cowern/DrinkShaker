//
//  DrinkShakerApp.swift
//  DrinkShaker
//
//  Created by Thomas Cowern on 9/2/22.
//

import SwiftUI

@main
struct DrinkShakerApp: App {
    @StateObject var dataController: DataController
    
    init() {
        let dataContoller = DataController()
        _dataController = StateObject(wrappedValue: dataContoller)
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
                .environmentObject(dataController)
        }
    }
}
