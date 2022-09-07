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
        recipes = FetchRequest<Recipe>(entity: Recipe.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \Recipe.dateAdded, ascending: true)])
    }
    
    var body: some View {
        NavigationView {
            List {
                ForEach(recipes.wrappedValue) { recipe in
                    Section(header: Text(recipe.recipeName)) {
                        ForEach(recipe.recipeIngredients) { ingredient in
                            Text(ingredient.ingredientName)
                        }
                    }
                }
            }
            .listStyle(InsetGroupedListStyle())
            .navigationBarTitle("Favorites")
        }
    }
}

struct FavoritesView_Previews: PreviewProvider {
    static var dataController = DataController.preview
    
    static var previews: some View {
        FavoritesView()
            .environment(\.managedObjectContext, dataController.container.viewContext)
            .environmentObject(dataController)
    }
}
