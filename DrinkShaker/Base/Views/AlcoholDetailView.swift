//
//  AlcoholDetailView.swift
//  DrinkShaker
//
//  Created by Thomas Cowern on 3/20/24.
//

import SwiftUI

struct AlcoholDetailView: View {
    
    var spirit: String
    
    var body: some View {
        ZStack {
            
            Form {
                ScrollView {
                    Text(spirit)
                        .padding([.top, .bottom], 10)
                        .font(.title)
                        .foregroundStyle(.white)
                        .font(.system(.body, design: .rounded))
                        .frame(maxWidth: .infinity)
                        .background(Theme.dodgerBlue)
                    
//                    if (ingredient.alcoholByVolume != nil) {
//                        VStack(spacing: 10) {
//                            HStack {
//                                Text("Alcohol by Volume")
//                                Text(ingredient.alcoholByVolume! + "%")
//                            }
//                            Divider()
//                            HStack {
//                                Text("Contains Alcohol")
//                                Image(systemName: ingredient.ingredientContainsAlcohol == "Yes" ? "checkmark.seal.fill" : "x.circle.fill")
//                                    .foregroundStyle(ingredient.ingredientContainsAlcohol == "Yes" ? Color.green : Color.red)
//                            }
//                        }
//                        .padding(.vertical)
//                    }
//                    
//                    Text(ingredient.ingredientDescrtiption)
//                        .multilineTextAlignment(.leading)
//                        .font(.system(.subheadline, design: .rounded).weight(.semibold))
                    
                    
                }
            }
        }
        .onAppear {
            print("Appearing")
        }
    }
}

#Preview {
    AlcoholDetailView(spirit: "Vodka")
}
