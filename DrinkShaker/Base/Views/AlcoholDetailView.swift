//
//  AlcoholDetailView.swift
//  DrinkShaker
//
//  Created by Thomas Cowern on 3/20/24.
//

import SwiftUI

struct AlcoholDetailView: View {
    
    //    var spiritName: String?
    var spiritDetail: Ingredient
    
    var body: some View {
        ZStack {
            
            Form {
                ScrollView {
                    Text(spiritDetail.ingredientName)
                        .padding([.top, .bottom], 10)
                        .font(.title)
                        .foregroundStyle(.white)
                        .font(.system(.body, design: .rounded))
                        .frame(maxWidth: .infinity)
                        .background(Theme.dodgerBlue)
                    
                    if (spiritDetail.alcoholByVolume != nil) {
                        VStack(spacing: 10) {
                            HStack {
                                Text("Alcohol by Volume")
                                Text((spiritDetail.alcoholByVolume!) + "%")
                            }
                        }
                        
                        Divider()
                    }

                    HStack {
                        Text("Contains Alcohol")
                        Image(systemName: spiritDetail.ingredientContainsAlcohol == "Yes" ? "checkmark.seal.fill" : "x.circle.fill")
                            .foregroundStyle(spiritDetail.ingredientContainsAlcohol == "Yes" ? Color.green : Color.red)
                    }
                    .padding(10)
                    
                    Text(spiritDetail.ingredientDescrtiption)
                        .multilineTextAlignment(.leading)
                        .font(.system(.subheadline, design: .rounded).weight(.semibold))
                }
            }
        }
    }
}

//#Preview {
//    var previewSpiritDetail: Ingredients {
//        let spirit = try! StaticJsonMapper.decode(file: "IngredientDetailStaticJSON", type: Ingredients.self)
//        print("Spirit :\(spirit)")
//
//        return spirit
//    }
//
//    return AlcoholDetailView(spiritName: previewSpiritDetail, spiritDetail: <#Ingredient#>)
//}
