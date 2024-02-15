//
//  DrinkInfoView.swift
//  DrinkShaker
//
//  Created by Thomas Cowern on 2/15/24.
//

import SwiftUI

struct DrinkInfoView: View {
    
    let drink: Drink
    
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        VStack(alignment: .center, spacing: 10) {
            
            Text("Drink Info")
                .fontWeight(.black)
            
            VStack(alignment: .leading) {
                drinkInfo
                
                imageSource
            }
            
            dismissButton
        }
        .frame(minWidth: 0, maxWidth: .infinity)
        .padding(.top, 15)
        .padding(.bottom, 25)
        .padding(.horizontal, 25)
    }
}

#Preview {
    
    var previewDrink: Drink {
        let drinks = try! StaticJsonMapper.decode(file: "DrinksStaticJson", type: CocktailDBAPIResponse.self)
        
        return drinks.drinks[1]
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

private extension DrinkInfoView {
    var drinkInfo: some View {
        VStack(alignment: .leading, spacing: 10) {
            if let drinkImage = drink.imageAttribute {
                RowAppInfoView(itemOne: "Image By", itemTwo: drinkImage)
            }
            RowAppInfoView(itemOne: "Creative Commons", itemTwo: drink.creativeCommonsConfirmed ?? "")
            RowAppInfoView(itemOne: "Date Modified", itemTwo: drink.dateModified ?? "")
        }
    }
    
    var imageSource: some View {
        VStack(alignment: .leading) {
            if let imageSource = drink.imageSource {
                Text("Image source")
                    .foregroundColor(.gray)
                Text(imageSource)
                    .multilineTextAlignment(.leading)
                    .font(.footnote)
            } else {
                EmptyView()
            }
        }
    }
    
    var dismissButton: some View {
        Button {
            dismiss()
        } label: {
            Text("Continue".uppercased())
        }
        .buttonStyle(.bordered)
        .padding([.top], 10)
    }
}

