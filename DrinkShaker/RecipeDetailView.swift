//
//  RecipeDetailView.swift
//  DrinkShaker
//
//  Created by Thomas Cowern on 9/14/22.
//

import SwiftUI

struct RecipeDetailView: View {
    
    @State var drinkRecipe: RecipeModel
    
    var body: some View {
        VStack {
            HStack {
                Image("martini")
                    .resizable()
                    .frame(width: 150, height: 150)
                VStack {
                    Text("Martini")
                        .font(.largeTitle)
                    Text("Martini Glass")
                        .font(.headline)
                }
            }
            Text("How to make it:")
                .font(.largeTitle)
            Text("Mix it all together and stir")
        }
        
        
    }
}

struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeDetailView(drinkRecipe: RecipeModel(idDrink: "01", strDrink: "Martini", strInstructions: "Vodka, Vermout, Olives and stir", strCategory: "Cocktail", strGlass: "Martini glass"))
    }
}
