//
//  RandomDrinkView.swift
//  DrinkShaker
//
//  Created by Thomas Cowern on 9/14/22.
//

import SwiftUI

struct RandomDrinkView: View {
    
    @StateObject private var nc = NetworkingController()
    @State var isShowingRecipeDetailView = false
    @State var isHidden: Bool = false
    
    var body: some View {
        NavigationView {
            Text("Shake Your Phone for a random Drink!")
                .opacity(isHidden ? 0 : 1)
            .onShake {
                print("This is where we get a random recips")
                nc.fetchRandomDrinkRecipe()
                isHidden.toggle()
                isShowingRecipeDetailView = true
            }
            ForEach(nc.drinkRecipes, id: \.idDrink) { recipe in
                NavigationLink(destination: RecipeDetailView(drinkRecipe: recipe)) {
                    EmptyView()
                }
            }
                
        }
        
    }
}

struct RandomDrinkView_Previews: PreviewProvider {
    static var previews: some View {
        RandomDrinkView()
    }
}
