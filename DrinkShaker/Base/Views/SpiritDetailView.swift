//
//  AlcoholDetailView.swift
//  DrinkShaker
//
//  Created by Thomas Cowern on 3/20/24.
//

import SwiftUI

struct SpiritDetailView: View {
    
    var spirit: Ingredient
//    var spiritName: String
//    @StateObject private var sdvm = SpiritDetailViewModel()
    
    var body: some View {
        ZStack {
            Form {
                ScrollView {
                    Text(spirit.ingredientName)
                        .padding([.top, .bottom], 10)
                        .font(.title)
                        .foregroundStyle(.white)
                        .font(.system(.body, design: .rounded))
                        .frame(maxWidth: .infinity)
                        .background(Theme.dodgerBlue)
                    
                    if (spirit.alcoholByVolume != nil) {
                        VStack(spacing: 10) {
                            HStack {
                                Text("Alcohol by Volume")
                                Text((spirit.alcoholByVolume ?? "0") + "%")
                            }
                        }
                        
                        Divider()
                    }

                    HStack {
                        Text("Contains Alcohol")
                        Image(systemName: spirit.ingredientContainsAlcohol == "Yes" ? "checkmark.seal.fill" : "x.circle.fill")
                            .foregroundStyle(spirit.ingredientContainsAlcohol == "Yes" ? Color.green : Color.red)
                    }
                    .padding(10)
                    
                    if let spiritDescription = spirit.ingredientDescrtiption {
                        Text(spiritDescription)
                            .multilineTextAlignment(.leading)
                            .font(.system(.subheadline, design: .rounded).weight(.semibold))
                    } else {
                        Text("No Description Available")
                    }
                    
                }
            }
        }
    }
}

#Preview {
    var previewSpiritDetail: Ingredient {
        let spirit = try! StaticJsonMapper.decode(file: "IngredientDetailStaticJSON", type: Ingredients.self)
        print("Spirit :\(spirit)")

        return spirit.ingredients.first!
    }

    return SpiritDetailView(spirit: previewSpiritDetail)
}
