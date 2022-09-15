//
//  RandomDrinkView.swift
//  DrinkShaker
//
//  Created by Thomas Cowern on 9/14/22.
//

import SwiftUI

struct RandomDrinkView: View {
    
    @StateObject private var nc = NetworkingController()
    @State var isShowingRecipeDetailView = false
    @State var isHidden: Bool = false
    
    var body: some View {
        VStack {
            HStack {
                if nc.randomRecipe?.strDrinkThumb != nil {
                    AsyncImage(url: URL(string: nc.drinkRecipes[0].strDrinkThumb!)) { phase in
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
                    Text(nc.randomRecipe?.strDrink ?? "Default")
                        .font(.largeTitle)
                    Text(nc.randomRecipe?.strGlass ?? "Default")
                        .font(.headline)
                }
            }
            Button("Click for a random Drink") {
                nc.fetchRandomDrinkRecipe()
            }
     

            Text("Shake Your Phone for a random Drink!")
                .opacity(isHidden ? 0 : 1)
            .onShake {
                print("This is where we get a random recips")
    //                nc.fetchRandomDrinkRecipe()
                    isHidden = true
    //                isShowingRecipeDetailView = true
            }
        }
        

    }
}

struct RandomDrinkView_Previews: PreviewProvider {
    static var previews: some View {
        RandomDrinkView()
    }
}
