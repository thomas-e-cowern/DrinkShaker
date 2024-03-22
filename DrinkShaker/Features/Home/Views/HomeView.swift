//
//  HomeView.swift
//  DrinkShaker
//
//  Created by Thomas Cowern on 2/13/24.
//

import SwiftUI

struct HomeView: View {
    
    @State private var drinkOfDay: Drink?
    @State private var ingredientOfDay: String?
    @State private var drinks: [Drink] = []
    @State private var ingredients: [IngredientName] = []
    @State var spirit: String?
    
    @StateObject private var hvm = HomeViewModel()
    
    var body: some View {
        NavigationStack {
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
                            ingredientOfTheDay
                            
                        }
                    }
                }
                
            }
            .onAppear {
                do {
                    hvm.getSpiritOfTheDay()
                    
                    let res = try StaticJsonMapper.decode(file: "DrinksStaticJson", type: CocktailDBAPIResponse.self)
                    
                    drinks = res.drinks
                    drinkOfDay = res.drinks.randomElement()
                
                } catch {
                    print(error)
                }
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
                        NavigationLink {
                            DrinkDetailView(drink: drink)
                        } label: {
                            DrinkCardView(drink: drink)
                        }
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
                        NavigationLink {
                            DrinkDetailView(drink: drink)
                        } label: {
                            DrinkCardView(drink: drink)
                        }
                    }
                }
            }
            .frame(width: UIScreen.main.bounds.width)
        }
    }
    
    var ingredientOfTheDay: some View {
        VStack {
            Text("Spirit of the day...")
                .font(.largeTitle)
            
            
            // MARK: TODO - Change to get indredient details by name
            HStack(spacing: 10) {
                if let spirit = hvm.spiritOfTheDayName {
                    NavigationLink {
                        // MARK: TODO - Add nav to alcohol detail view
                        Text("\(spirit)")
//                        AlcoholDetailView(spiritDetail: spirit)
                    } label: {
                        AlcoholView(alcohol: spirit)
                    }
                }
            }
            .frame(width: UIScreen.main.bounds.width)
        }
    }
}
