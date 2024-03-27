//
//  DrinkOfTheDayDetailView.swift
//  DrinkShaker
//
//  Created by Thomas Cowern on 3/26/24.
//

import SwiftUI

struct DrinkOfTheDayDetailView: View {
    
    var drinkName: String
    @StateObject private var dotdvm = DrinkOfTheDayViewModel()
    
    var body: some View {
        ZStack {
            
            Theme.background
            
            Form {
                ScrollView {
                    VStack(alignment: .leading, spacing: 0) {
                        
                        
                        AsyncImage(url: URL(string: dotdvm.drinkOfTheDayDetails?.image ?? "")) { image in
                            image
                                .resizable()
                                .scaledToFit()
                                .frame(width: 300, height: 300)
                        } placeholder: {
                            ProgressView()
                        }
                        
                        Text(dotdvm.drinkOfTheDayDetails?.name ?? "No name")
                            .padding([.top, .bottom], 10)
                            .font(.callout)
                            .foregroundStyle(.white)
                            .font(.system(.body, design: .rounded))
                            .frame(maxWidth: .infinity)
                            .background(Theme.dodgerBlue)
                        
                        
                        HStack(alignment: .center) {
                            Spacer()
                            HStack(spacing: 10) {
                                Text(dotdvm.drinkOfTheDayDetails?.alcohol ?? "no alcohol")
                                Divider()
                                Text(dotdvm.drinkOfTheDayDetails?.glass ?? "no glass")
                            }
                            .padding([.top], 12)
                            Spacer()
                        }
                        
                        VStack(alignment: .leading) {
                            Text("Ingredients:")
                                .font(.system(.body, design: .rounded).weight(.semibold))
                                .padding([.bottom], 5)
                            
                            if let ingredients = dotdvm.drinkOfTheDayDetails?.ingredientsAndMeasures {
                                ForEach(ingredients, id: \.self) { item in
                                    Text(item)
                                }
                                .font(.system(.subheadline, design: .rounded).weight(.semibold))
                            }
                            
                        }
                        .padding(([.top]))
                        
                        VStack(alignment: .leading) {
                            Text("Instructions:")
                                .font(.system(.body, design: .rounded).weight(.semibold))
                                .padding([.bottom], 5)
                            if let instructions = dotdvm.drinkOfTheDayDetails?.instructions {
                                Text(instructions)
                                    .multilineTextAlignment(.leading)
                                    .font(.system(.subheadline, design: .rounded).weight(.semibold))
                            }
                            
                        }
                        .padding(([.top]))
                        
                        Spacer()
                        
                    } //: End of VStack
                    .frame(width: 300)
                    .clipShape(RoundedRectangle(cornerRadius: 16))
                    .shadow(color: Theme.text.opacity(0.1), radius: 2, x: 0, y: 1)
                    .padding([.leading, .trailing], 10)
                }
                
            }
        }
        .onAppear {
            dotdvm.getDrinkOfTheDay(drinkName: drinkName)
        }

    }
}

#Preview {
    
    var previewDrink: Drink {
        let drinks = try! StaticJsonMapper.decode(file: "DrinksStaticJson", type: CocktailDBAPIResponse.self)
        
        return drinks.drinks[4]
    }
    
    return DrinkOfTheDayDetailView(drinkName: "Vodka")
}
