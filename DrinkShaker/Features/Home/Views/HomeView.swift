//
//  HomeView.swift
//  DrinkShaker
//
//  Created by Thomas Cowern on 2/13/24.
//

import SwiftUI

struct HomeView: View {
    
    @State private var drinkOfDay: Drink?
    @State private var ingredientOfDay: Ingredient?
    @State private var drinks: [Drink] = []
    @State private var ingredients: [Ingredient] = []
    
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
                        
                        // Ingredient of the day
                        
                    }
                }
            }
            
        }
        .onAppear {
            do {
                let res = try StaticJsonMapper.decode(file: "DrinksStaticJson", type: CocktailDBAPIResponse.self)
                
                drinks = res.drinks
                drinkOfDay = res.drinks.randomElement()
                
                let ingredientRes = try StaticJsonMapper.decode(file: "IngredientsStaticJson", type: IngredientsAPIResponse.self)
                
                ingredients = ingredientRes.drinks
                ingredientOfDay = ingredients.randomElement()
                print("Ingredient of the day: \(ingredientOfDay)")
                
                
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
