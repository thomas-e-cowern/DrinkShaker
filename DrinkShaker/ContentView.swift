//
//  ContentView.swift
//  DrinkShaker
//
//  Created by Thomas Cowern on 2/13/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
//        NavigationStack {
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
//            }
        }
    }
}

#Preview {
    ContentView()
}
