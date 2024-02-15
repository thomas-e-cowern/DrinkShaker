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
            
            RowAppInfoView(itemOne: "Image By", itemTwo: drink.imageAttribute ?? "")
            RowAppInfoView(itemOne: "Creative Commons", itemTwo: drink.creativeCommonsConfirmed ?? "")
            RowAppInfoView(itemOne: "Date Modified", itemTwo: drink.dateModified ?? "")
            
            
            VStack(alignment: .leading) {
                Text("Image source")
                    .foregroundColor(.gray)
                Text(drink.imageSource ?? "")
                    .multilineTextAlignment(.leading)
                    .font(.footnote)
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

struct RowAppInfoView: View {
    // MARK: - Properties
    var itemOne: String
    var itemTwo: String
    
    var body: some View {
        VStack {
            HStack {
                Text(itemOne)
                    .foregroundColor(.gray)
                Spacer()
                Text(itemTwo)
            }
            Divider()
        }
    }
}
