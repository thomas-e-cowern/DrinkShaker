//
//  DrinkDetailView.swift
//  DrinkShaker
//
//  Created by Thomas Cowern on 2/14/24.
//

import SwiftUI

struct DrinkDetailView: View {
    
    let drink: Drink
    
    var body: some View {
        ZStack {
            
            background
            
            ScrollView {
                VStack(alignment: .center, spacing: 0) {
                    
                    
                    drinkImage
                        .frame(width: 300, height: 300)
                    
                    Text(drink.name)
                        .padding([.top, .bottom], 10)
                        .font(.callout)
                        .foregroundStyle(.white)
                        .font(.system(.body, design: .rounded))
                        .frame(maxWidth: .infinity)
                        .background(Theme.dodgerBlue)
                    
                    
                    generalInfo
                    
                    instructions
                    
                    Spacer()
                    
                } //: End of VStack
                .frame(width: 300)
                .clipShape(RoundedRectangle(cornerRadius: 16))
                .shadow(color: Theme.text.opacity(0.1), radius: 2, x: 0, y: 1)
                .padding([.leading, .trailing], 10)
            }
        }
    }
}

#Preview {
    
    var previewDrink: Drink {
        let drinks = try! StaticJsonMapper.decode(file: "DrinksStaticJson", type: CocktailDBAPIResponse.self)
        
        return drinks.drinks[4]
    }
    
    return DrinkDetailView(drink: previewDrink)
}

private extension DrinkDetailView {
    
    var background: some View {
        Theme.background
    }
    
    @ViewBuilder
    var drinkImage: some View {
        AsyncImage(url: URL(string: drink.image)) { image in
            image
                .resizable()
                .scaledToFit()
                .frame(width: 300, height: 300)
        } placeholder: {
            ProgressView()
        }
    }
    
    var generalInfo: some View {
        VStack(spacing: 10) {
            isAlcoholic
            glassUsed
        }
        .padding([.top], 12)
    }
    
    @ViewBuilder
    var isAlcoholic: some View {
        HStack {
            Text("Has Alcohol")
                .font(.system(.body, design: .rounded).weight(.semibold))
            
            Image(systemName: drink.alcohol == "Alcoholic" ? "checkmark.seal.fill" : "x.circle.fill")
                .foregroundStyle(drink.alcohol == "Alcoholic" ? Color.green : Color.red)
        }
    }
    
    @ViewBuilder
    var glassUsed: some View {
        HStack {
            Text("Glass Used:")
                .font(.system(.body, design: .rounded).weight(.semibold))
            
            Text(drink.glass)
                .font(.system(.subheadline, design: .rounded).weight(.semibold))
            
        }
    }
    
    @ViewBuilder
    var instructions: some View {
        Text(drink.instructions)
            .multilineTextAlignment(.leading)
            .font(.system(.subheadline, design: .rounded).weight(.semibold))
            .padding()
    }
}
