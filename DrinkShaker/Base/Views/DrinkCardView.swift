//
//  DrinkCardView.swift
//  DrinkShaker
//
//  Created by Thomas Cowern on 2/14/24.
//

import SwiftUI

struct DrinkCardView: View {
    
    let drink: Drink
    
    var body: some View {
        VStack(spacing: 0) {
            AsyncImage(url: URL(string: drink.image)) { image in
                image
                    .resizable()
                    .scaledToFit()
                    
            } placeholder: {
                ProgressView()
            }
            
            Text(drink.name)
                .padding([.top, .bottom], 10)
                .font(.callout)
                .foregroundStyle(.white)
                .font(.system(.body, design: .rounded))
                .frame(maxWidth: .infinity)
                .background(Theme.dodgerBlue)
        }
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .frame(width: 200)
        .padding()
    }
}

#Preview {
    
    var previewDrink: Drink {
        let drinks = try! StaticJsonMapper.decode(file: "DrinksStaticJson", type: CocktailDBAPIResponse.self)
        
        return drinks.drinks[4]
    }
    
    return DrinkCardView(drink: previewDrink)
}
