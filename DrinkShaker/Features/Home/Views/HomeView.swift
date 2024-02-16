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
                        drinkOfTheDay
                        
                        Divider()
                        
                        // Popular drinks
                        popularDrinks
                        
                        Divider()
                        
                        // Newest drinks
                        newestDrinks
                        
                        Divider()
                        
                        // Booze of the day
                        
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

private extension HomeView {
    var drinkOfTheDay: some View {
        VStack {
            Text("Drink of the day....")
                .font(.largeTitle)
            
            if let drinkOfDay = drinkOfDay {
                DrinkCardView(drink: drinkOfDay)
                    .frame(width: 200)
            }
        }
    }
    
    var popularDrinks: some View {
        VStack {
            Text("Popular drinks...")
                .font(.largeTitle)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 10) {
                    ForEach(drinks) { drink in
                        DrinkCardView(drink: drink)
                    }
                }
            }
            .frame(width: UIScreen.main.bounds.width)
        }
    }
    
    var newestDrinks: some View {
        VStack {
            Text("Newest drinks...")
                .font(.largeTitle)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 10) {
                    ForEach(drinks) { drink in
                        DrinkCardView(drink: drink)
                    }
                }
            }
            .frame(width: UIScreen.main.bounds.width)
        }
    }
}
