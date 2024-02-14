//
//  DrinkShakerApp.swift
//  DrinkShaker
//
//  Created by Thomas Cowern on 2/13/24.
//

import SwiftUI

@main
struct DrinkShakerApp: App {
    var body: some Scene {
        WindowGroup {
            TabView {
                HomeView()
                    .tabItem {
                        Symbols.home
                        Text("Home")
                    }
                RandomDrinkView()
                    .tabItem {
                        Symbols.random
                        Text("Random")
                    }
                SearchView()
                    .tabItem {
                        Symbols.magnifyingglass
                        Text("Search")
                    }
            }
        }
    }
}
