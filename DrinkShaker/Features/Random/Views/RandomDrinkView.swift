//
//  RandomDrinkView.swift
//  DrinkShaker
//
//  Created by Thomas Cowern on 2/13/24.
//

import SwiftUI

struct RandomDrinkView: View {
    
    @State var placeholderIsShowing = true
    @State var isHidden: Bool = true
    @State var isSearching: Bool = false
    
    @StateObject private var rvm = RandomViewModel()
    
    var body: some View {
        NavigationStack {
            ZStack {
                Theme.background
                    .ignoresSafeArea()
                if placeholderIsShowing {
                    VStack {
                        Image(systemName: "wineglass")
                            .foregroundColor(Color.red)
                            .font(.largeTitle)
                    }
                }
                VStack (alignment: .center) {
                    Text(rvm.drink?.name ?? "")
                        .font(.largeTitle)
                        .toolbar {
                            ToolbarItem {
                                Button("Random") {
                                    Task {
                                        await getRandomDrink()
                                    }
                                }
                                
                            }
                            ToolbarItem(placement: .bottomBar) {
                                Text("Shake Your Phone for a random Drink!")
                                    .font(.title3)
                            }
                        }
                    HStack {
                        if rvm.drink?.image != nil {
                            AsyncImage(url: URL(string:
                                                    (rvm.drink?.image)!)) { phase in
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
                    //                    .onShake {
                    //                        isHidden = false
                    //                        placeholderIsShowing = false
                    //                        rvm.getRandomDrink()
                    //                    }
                    Text("Served in: " + (rvm.drink?.glass ?? "No glass listed"))
                        .font(.headline)
                        .opacity(isHidden ? 0 : 1)
                    
                    HStack {
                        //                        List {
                        //                            ForEach(nc.randomRecipe?.ingredientsAndMeasures ?? [""], id: \.self) { ingredient in
                        //                                Text(ingredient)
                        //                            }
                        //                        }
                    }
                }
            }
        } // MARK: End of Navigation
        
    }
    
    func getRandomDrink() async {
        print("In")
        await rvm.getRandomDrink()
    }
}

#Preview {
    RandomDrinkView()
}
