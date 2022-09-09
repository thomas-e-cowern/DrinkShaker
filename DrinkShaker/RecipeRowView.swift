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
        HStack {
            if recipe.strDrinkThumb != nil {
                            AsyncImage(url: URL(string: recipe.strDrinkThumb!)) { phase in
                                switch phase {
                                case .empty:
                                    ProgressView()
                                case .success(let image):
                                    image
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(maxWidth: .infinity, maxHeight: 150)
                                        .padding(.leading, 40)
                                        .padding(.trailing, 40)
                                        .padding(.top, 40)
                                        .padding(.bottom, 40)
                                        .background(Color.white)
                                case .failure(let fail):
//                                    Text("Failure: \(fail.localizedDescription)")
                                    Image(systemName: "wind.snow")
                                        .resizable()
                                        .padding()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(maxWidth: 400, maxHeight: 200)
                                @unknown default:
                                    EmptyView()
                                }
                            }
            }
            
            VStack(alignment: .leading) {
                Text(recipe.strDrink)
                    .font(.title)
                    .padding(.bottom, 5)
                Text(recipe.strInstructions)
            }
        }
    
        
    }
}

struct RecipeRowView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeRowView(recipe: .init(idDrink: "Drink ID", strDrink: "Drink Name", strInstructions: "Drink Instructions", strDrinkThumb: "Drink Thmubnail"))
    }
}
