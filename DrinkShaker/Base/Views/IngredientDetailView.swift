//
//  IngredientDetailView.swift
//  DrinkShaker
//
//  Created by Thomas Cowern on 3/19/24.
//

import SwiftUI

struct IngredientDetailView: View {
    
    let ingredient: Ingredient
    
    var body: some View {
        ZStack {
            
            Form {
                ScrollView {
                    Text(ingredient.ingredientName)
                        .padding([.top, .bottom], 10)
                        .font(.title)
                        .foregroundStyle(.white)
                        .font(.system(.body, design: .rounded))
                        .frame(maxWidth: .infinity)
                        .background(Theme.dodgerBlue)
                    
                    if (ingredient.alcoholByVolume != nil) {
                        VStack(spacing: 10) {
                            HStack {
                                Text("Alcohol by Volume")
                                Text(ingredient.alcoholByVolume! + "%")
                            }
                            Divider()
                            HStack {
                                Text("Contains Alcohol")
                                Image(systemName: ingredient.ingredientContainsAlcohol == "Yes" ? "checkmark.seal.fill" : "x.circle.fill")
                                    .foregroundStyle(ingredient.ingredientContainsAlcohol == "Yes" ? Color.green : Color.red)
                            }
                        }
                        .padding(.vertical)
                    }
                    
                    if let ingeredientDescription = ingredient.ingredientDescrtiption {
                        Text(ingeredientDescription)
                            .multilineTextAlignment(.leading)
                            .font(.system(.subheadline, design: .rounded).weight(.semibold))
                    }
                    
                    
                    
                }
            }
        }
    }
}

#Preview {
    
    var previewIngredient: Ingredient {
        let ingredients = try! StaticJsonMapper.decode(file: "IngredientDetailStaticJSON", type: Ingredients.self)
        
        return ingredients.ingredients[0]
    }
    
    return IngredientDetailView(ingredient: previewIngredient)
}
