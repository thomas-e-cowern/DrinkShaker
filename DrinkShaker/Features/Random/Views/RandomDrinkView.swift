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
                            .padding()
                        
                        Text("Shake Your Phone for a random Drink!")
                            .font(.title3)
                            .padding(3)
                        Text("(...or press the Random button on top!)")
                            .font(.title3)
                    }
                }
                
                VStack {
                    HStack(spacing: 10) {
                        if let drink = rvm.drink {
                            NavigationLink {
                                DrinkDetailView(drink: drink)
                            } label: {
                                DrinkCardView(drink: drink)
                            }
                        }
                    }
                    .frame(width: UIScreen.main.bounds.width)
                    .toolbar {
                        ToolbarItem {
                            Button("Random") {
                                Task {
                                    placeholderIsShowing = false
                                    await getRandomDrink()
                                }
                            }
                        }
                    }
                }
                .onShake {
                    isHidden = false
                    placeholderIsShowing = false
                    Task {
                        await getRandomDrink()
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
