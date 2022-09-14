//
//  ContentView.swift
//  DrinkShaker
//
//  Created by Thomas Cowern on 9/2/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Image(systemName: "house.circle")
                    Text("Home")
                }
            FavoritesView()
                .tabItem {
                    Image(systemName: "f.circle")
                    Text("Favorites")
                }
            SearchView()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text("Search")
                }
            RandomDrinkView()
                .tabItem {
                    Image(systemName: "x.circle.fill")
                    Text("Random")
                }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var dataController = DataController.preview
    
    static var previews: some View {
        ContentView()
            .environment(\.managedObjectContext, dataController.container.viewContext)
            .environmentObject(dataController)
    }
}
