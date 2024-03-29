//
//  HomeView.swift
//  DrinkShaker
//
//  Created by Thomas Cowern on 2/13/24.
//

import SwiftUI

struct HomeView: View {
    
    @State private var drinkOfDay: Drink?
    
    @StateObject private var hvm = HomeViewModel()
    @StateObject private var pdvm = PopularDrinksViewModel()
    @StateObject private var ndvm = NewestDrinksViewModel()
    
    var body: some View {
        NavigationStack {
            ZStack {
                Theme.background
                    .ignoresSafeArea()
                
                VStack {
                    HeaderView()
                        .padding([.bottom], 10)
                        
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
                        .padding([.top], 0)
                    }
                }
                .ignoresSafeArea()
            }
            .task {
                // 1. get drink of the day
                await hvm.getDrinkOfTheDay()
                
                // 2. Get list of popular drinks
                await pdvm.getPopularDrinks()
                
                // 3. Get list of newest drinks
                await ndvm.getNewestDrinks()
                
                // 4. get spirit of the day
                await hvm.getSpiritOfTheDay()
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
            Text("Drink of the day...")
                .font(.largeTitle)
            
            HStack(spacing: 10) {
                if let drink = hvm.drinkOfTheDay {
                    NavigationLink {
                        DrinkDetailView(drink: drink)
                    } label: {
                        DrinkCardView(drink: drink)
                    }
                }
            }
            .frame(width: UIScreen.main.bounds.width)
        }
    }
    
    var popularDrinks: some View {
        VStack {
            Text("Popular drinks...")
                .font(.largeTitle)
            
            if pdvm.hasError {
                Text(pdvm.error?.localizedDescription ?? "Something went wrong")
            } else {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 10) {
                        ForEach(pdvm.popularDrinks) { drink in
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
    }
    
    var newestDrinks: some View {
        VStack {
            Text("Newest drinks...")
                .font(.largeTitle)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 10) {
                    ForEach(ndvm.newestDrinks) { drink in
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
            HStack(spacing: 10) {
                if let spirit = hvm.spiritOfTheDay {
                    NavigationLink {
                        SpiritDetailView(spirit: spirit)
                    } label: {
                        SpiritView(alcohol: spirit.ingredientName)
                    }
                }
            }
            .frame(width: UIScreen.main.bounds.width)
        }
        .padding(.bottom, 100)
    }
}
