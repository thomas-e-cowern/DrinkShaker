//
//  RecipeRowView.swift
//  DrinkShaker
//
//  Created by Thomas Cowern on 9/9/22.
//

import SwiftUI

struct RecipeRowView: View {
    
    @StateObject private var nc = NetworkingController()
    let recipe: RecipeModel
    
    var body: some View {
        HStack(alignment: .center) {
            if recipe.strDrinkThumb != nil {
                            AsyncImage(url: URL(string: recipe.strDrinkThumb!)) { phase in
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
            
            VStack(alignment: .leading) {
                Text(recipe.strDrink)
                    .font(.title2)
                    .padding(.bottom, 5)
                Text(recipe.strCategory)
                    .padding(.bottom, 2)
                Text(recipe.strGlass)
            }
        }
    
        
    }
}

struct RecipeRowView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeRowView(recipe: .init(idDrink: "Drink ID", strDrink: "Drink Name", strInstructions: "Drink Instructions", strDrinkThumb: "Drink Thmubnail", strCategory: "Drink Category", strGlass: "Drink Glass"))
    }
}
