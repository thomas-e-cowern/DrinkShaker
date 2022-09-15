//
//  RandomDrinkView.swift
//  DrinkShaker
//
//  Created by Thomas Cowern on 9/14/22.
//

import SwiftUI

struct RandomDrinkView: View {
    
    @StateObject private var nc = NetworkingController()
    @State var isHidden: Bool = true
    @State var placeholderIsShowing = true
    
    var body: some View {
        NavigationView {
            if placeholderIsShowing {
                ZStack {
                    Image(systemName: "wineglass")
                        .foregroundColor(Color.red)
                        .font(.largeTitle)
                    Text("Shake for a random drink")
                }
            }
            VStack (alignment: .center) {
                Text(nc.randomRecipe?.strDrink ?? "")
                    .font(.largeTitle)
                    .toolbar {
                        ToolbarItem {
                            Button {
                                isHidden = false
                                placeholderIsShowing = false
                                nc.fetchRandomDrinkRecipe()
                            } label: {
                                Text("Random")
                            }
                        }
                        ToolbarItem(placement: .bottomBar) {
                            Text("Shake Your Phone for a random Drink!")
                                .font(.title3)
                        }
                    }
                HStack {
                    if nc.randomRecipe?.strDrinkThumb != nil {
                        AsyncImage(url: URL(string:
                            (nc.randomRecipe?.strDrinkThumb!)!)) { phase in
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
                }
                .onShake {
                    isHidden = false
                    placeholderIsShowing = false
                    nc.fetchRandomDrinkRecipe()
                }
                Text("Served in: " + (nc.randomRecipe?.strGlass ?? ""))
                    .font(.headline)
                    .opacity(isHidden ? 0 : 1)
                
                HStack {
                    List {
                        ForEach(nc.randomRecipe?.ingredientsAndMeasures ?? [""], id: \.self) { ingredient in
                            Text(ingredient)
                        }
                    }
                }
            }
        }
    }
}

struct RandomDrinkView_Previews: PreviewProvider {
    static var previews: some View {
        RandomDrinkView()
    }
}
