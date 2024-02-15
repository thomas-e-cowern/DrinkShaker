//
//  HomeView.swift
//  DrinkShaker
//
//  Created by Thomas Cowern on 2/13/24.
//

import SwiftUI

struct HomeView: View {
    
    @State private var drinkOfDay: Drink?
    @State private var drinks: [Drink] = []
    
    var body: some View {
        ZStack {
            Theme.background
                .ignoresSafeArea()
            
            VStack {
                HeaderView()
                    .padding(.top, 25)
                ScrollView {
                    VStack {
                        // Drink of the day (Random drink)
                        Text("Drink of the day....")
                            .font(.largeTitle)
                        
                        if let drinkOfDay = drinkOfDay {
                            DrinkCardView(drink: drinkOfDay)
                                .frame(width: 200)
                        }
                        
                        Divider()
                        
                        // Popular drinks
                        Text("Popular drinks...")
                            .font(.largeTitle)
                        
                        ScrollView(.horizontal) {
                            HStack(spacing: 10) {
                                ForEach(drinks) { drink in
                                    DrinkCardView(drink: drink)
                                }
                            }
                        }
                        .frame(width: UIScreen.main.bounds.width)
                        
                        
                        // Latest drink
                        
                        
                        // Booze of the day (Vodka, whiskey, etc.)
                    }
                }
            }
            
        }
        .onAppear {
            do {
                let res = try StaticJsonMapper.decode(file: "DrinksStaticJson", type: CocktailDBAPIResponse.self)
                
                drinks = res.drinks
                drinkOfDay = res.drinks.randomElement()
            } catch {
                print(error)
            }
        }
    }
}

#Preview {
    HomeView()
}
