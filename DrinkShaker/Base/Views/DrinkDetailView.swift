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
        VStack(alignment: .center, spacing: 0) {
            
            
            AsyncImage(url: URL(string: drink.image)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 180, height: 180)
                    .clipped()
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
            
            
        } //: End of VStack
        .frame(width: 180, height: 300)
        .clipShape(RoundedRectangle(cornerRadius: 16))
        .shadow(color: Theme.text.opacity(0.1), radius: 2, x: 0, y: 1)
        .padding([.leading, .trailing], 10)
        
    }
}

#Preview {
    
    var previewDrink: Drink {
        let drinks = try! StaticJsonMapper.decode(file: "DrinksStaticJson", type: CocktailDBAPIResponse.self)
        
        return drinks.drinks[4]
    }
    
    return DrinkDetailView(drink: previewDrink)
}
