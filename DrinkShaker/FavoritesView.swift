//
//  FavoritesView.swift
//  DrinkShaker
//
//  Created by Thomas Cowern on 9/7/22.
//

import SwiftUI

struct FavoritesView: View {
    let recipes: FetchRequest<Recipe>
    
    init() {
        recipes = FetchRequest<Recipe>(entity: Recipe.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \Recipe.date, ascending: true)])
    }
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct FavoritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesView()
    }
}
