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
    @State private var alcoholOfTheDay: String?
    @State private var alcoholList: [Alcohol] = []
    private var date: Date = Date.now
    
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
                    let res = try StaticJsonMapper.decode(file: "DrinksStaticJson", type: CocktailDBAPIResponse.self)
                    
                    drinks = res.drinks
                    drinkOfDay = res.drinks.randomElement()
                    
                    let ingredientRes = try StaticJsonMapper.decode(file: "IngredientsStaticJson", type: IngredientsAPIResponse.self)
                    
                    // MARK: TODO - Change to get indredient details by name
                    // MARK: TODO - Randomly select a booze and store till end of day
        
                    ingredients = ingredientRes.drinks
                    ingredientOfDay = alcolohIngredients.randomElement()
                    
                    // MARK: Date check for spirit of the day.
                    // 1. get the current date
                    // 2. check stored date and compare, if the same do nothing, if different get a new spirit of the day
                    print(date)
                    print(Calendar.current.isDateInToday(date))
                    if !Calendar.current.isDateInToday(date) {
                        let alcoholsRes = try StaticJsonMapper.decode(file: "AlcoholListJSON", type:Alcohols.self)
                        alcoholList = alcoholsRes.alcohols
                        let todaySpirit = alcoholList.randomElement()
                        print(todaySpirit?.alcohol as Any)
                        UserDefaults.standard.set(alcoholOfTheDay, forKey: "alcoholOfTheDay")
                    } else {
                        let alcoholToday = UserDefaults.standard.object(forKey: "alcoholOfTheDay")
                        if let alcoholToday = alcoholToday {
                            alcoholOfTheDay = alcoholToday as? String
                        }
                    }
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
                if let alcohol = alcoholOfTheDay {
                    NavigationLink {
                        // MARK: TODO - Add nav to alcohol detail view
                        AlcoholDetailView(spirit: alcohol)
                    } label: {
                        AlcoholView(alcohol: alcohol)
                    }
                    
                }
            }
            .frame(width: UIScreen.main.bounds.width)
        }
    }
}
