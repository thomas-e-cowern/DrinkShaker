//
//  RecipeDetailView.swift
//  DrinkShaker
//
//  Created by Thomas Cowern on 9/14/22.
//

import SwiftUI

struct RecipeDetailView: View {
    
    @State var drinkRecipe: RecipeModel
    
    var body: some View {
        VStack {
            HStack {
                if drinkRecipe.strDrinkThumb != nil {
                                AsyncImage(url: URL(string: drinkRecipe.strDrinkThumb!)) { phase in
                                    switch phase {
                                    case .empty:
                                        ProgressView()
                                    case .success(let image):
                                        image
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                            .frame(maxWidth: 100, maxHeight: 100)
                                            .padding(.leading, 5)
                                            .padding(.trailing, 5)
                                            .padding(.top, 10)
                                            .padding(.bottom, 10)
                                            .background(Color.white)
                                    case .failure(_):
    //                                    Text("Failure: \(fail.localizedDescription)")
                                        Image(systemName: "wind.snow")
                                            .resizable()
                                            .padding()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(maxWidth: 100, maxHeight: 100)
                                    @unknown default:
                                        EmptyView()
                                    }
                                }
                }
                
                VStack {
                    Text(drinkRecipe.strDrink)
                        .font(.largeTitle)
                    Text(drinkRecipe.strGlass)
                        .font(.headline)
                }
            }
            Text("How to make it:")
                .font(.largeTitle)
            Text(drinkRecipe.strInstructions)
        }
        
        
    }
}

struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeDetailView(drinkRecipe: RecipeModel(idDrink: "01", strDrink: "Martini", strInstructions: "Vodka, Vermout, Olives and stir", strCategory: "Cocktail", strGlass: "Martini glass"))
    }
}
