//
//  DrinkInfoView.swift
//  DrinkShaker
//
//  Created by Thomas Cowern on 2/15/24.
//

import SwiftUI

struct DrinkInfoView: View {
    
    let drink: Drink
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack {
                Text("Image by")
                Text(drink.imageAttribute ?? "")
            }
            
            VStack(alignment: .leading) {
                Text("Image source")
                Text(drink.imageSource ?? "")
                    .multilineTextAlignment(.leading)
            }
            
            HStack(alignment: .center) {
                Text("Creative Commons")
                Text(drink.creativeCommonsConfirmed ?? "")
                    .multilineTextAlignment(.leading)
            }
            
            HStack(alignment: .center) {
                Text("Date Modified")
                Text(drink.dateModified ?? "")
                    .multilineTextAlignment(.leading)
            }
        }
    }
}

#Preview {
    
    var previewDrink: Drink {
        let drinks = try! StaticJsonMapper.decode(file: "DrinksStaticJson", type: CocktailDBAPIResponse.self)
        
        return drinks.drinks[0]
    }
    
    return DrinkInfoView(drink: previewDrink)
}

