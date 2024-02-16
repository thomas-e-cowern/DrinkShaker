//
//  IngredientView.swift
//  DrinkShaker
//
//  Created by Thomas Cowern on 2/16/24.
//

import SwiftUI

struct IngredientView: View {
    
    let ingredient: String?
    
    var body: some View {
        if let ingredient = ingredient {
            VStack {
                Text(ingredient)
                
                AsyncImage(url: URL(string: "https://www.thecocktaildb.com/images/ingredients/\(ingredient)-Medium.png")) { image in
                    image
                        .resizable()
                        .scaledToFit()
                        
                } placeholder: {
                    ProgressView()
                }
            }
        }
    }
}

#Preview {
    IngredientView(ingredient: "Vodka")
}
