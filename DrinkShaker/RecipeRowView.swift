//
//  RecipeRowView.swift
//  DrinkShaker
//
//  Created by Thomas Cowern on 9/9/22.
//

import SwiftUI

struct RecipeRowView: View {
    
    let recipe: RecipeModel
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(recipe.strDrink)
                .font(.title)
                .padding(.bottom, 5)
            Text(recipe.strInstructions)
        }
    }
}

struct RecipeRowView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeRowView(recipe: .init(idDrink: "Drink ID", strDrink: "Drink Name", strInstructions: "Drink Instructions", strDrinkThumb: "Drink Thmubnail"))
    }
}
