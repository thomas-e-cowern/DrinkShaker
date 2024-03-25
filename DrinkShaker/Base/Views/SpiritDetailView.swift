//
//  AlcoholDetailView.swift
//  DrinkShaker
//
//  Created by Thomas Cowern on 3/20/24.
//

import SwiftUI

struct SpiritDetailView: View {
    
    var spiritName: String
    @StateObject private var sdvm = SpiritDetailViewModel()
    
    var body: some View {
        ZStack {
            Form {
                ScrollView {
                    Text(sdvm.spiriteDetail?.ingredientName ?? "")
                        .padding([.top, .bottom], 10)
                        .font(.title)
                        .foregroundStyle(.white)
                        .font(.system(.body, design: .rounded))
                        .frame(maxWidth: .infinity)
                        .background(Theme.dodgerBlue)
                    
                    if (sdvm.spiriteDetail?.alcoholByVolume != nil) {
                        VStack(spacing: 10) {
                            HStack {
                                Text("Alcohol by Volume")
                                Text((sdvm.spiriteDetail?.alcoholByVolume ?? "0") + "%")
                            }
                        }
                        
                        Divider()
                    }

                    HStack {
                        Text("Contains Alcohol")
                        Image(systemName: sdvm.spiriteDetail?.ingredientContainsAlcohol == "Yes" ? "checkmark.seal.fill" : "x.circle.fill")
                            .foregroundStyle(sdvm.spiriteDetail?.ingredientContainsAlcohol == "Yes" ? Color.green : Color.red)
                    }
                    .padding(10)
                    
                    if let spiritDescription = sdvm.spiriteDetail?.ingredientDescrtiption {
                        Text(spiritDescription)
                            .multilineTextAlignment(.leading)
                            .font(.system(.subheadline, design: .rounded).weight(.semibold))
                    } else {
                        Text("No Description Available")
                    }
                    
                }
            }
        }
        .onAppear {
            sdvm.getSpiritDetails(spiritName: spiritName)
        }
    }
}

#Preview {
    var previewSpiritDetail: String {
        let spirit = try! StaticJsonMapper.decode(file: "IngredientDetailStaticJSON", type: Ingredients.self)
        print("Spirit :\(spirit)")

        return spirit.ingredients.first?.ingredientName ?? ""
    }

    return SpiritDetailView(spiritName: previewSpiritDetail)
}
