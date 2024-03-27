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
            .task {
                await hvm.getRandomDrink()
            }
            .onAppear {
                
                // 1. Get spirit of the day
//                hvm.getSpiritOfTheDay()
                
                // 2. Get list of popular drinks
//                pdvm.getPopularDrinks()
                
                // 3. Get list of newest drinks
//                ndvm.getNewestDrinks()
                
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
                if let drink = hvm.drinkOfTheDayName {
                    NavigationLink {
                        DrinkOfTheDayDetailView(drinkName: drink)
                    } label: {

                            VStack {
                                Text(drink)
                                    .padding([.top, .bottom], 10)
                                    .font(.callout)
                                    .foregroundStyle(.white)
                                    .font(.system(.body, design: .rounded))
                                    .frame(maxWidth: .infinity)
                                    .background(Theme.dodgerBlue)
                                
                                AsyncImage(url: URL(string: "https://www.thecocktaildb.com/images/ingredients/\(drink)-Medium.png")) { image in
                                    image
                                        .resizable()
                                        .scaledToFit()
                                        
                                } placeholder: {
                                    ProgressView()
                                }
                            }
                            .frame(width: 200)

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
            
            
            // MARK: TODO - Change to get indredient details by name
            HStack(spacing: 10) {
                if let spirit = hvm.spiritOfTheDayName {
                    NavigationLink {
                        SpiritDetailView(spiritName: spirit)
                    } label: {
                        SpiritView(alcohol: spirit)
                    }
                }
            }
            .frame(width: UIScreen.main.bounds.width)
        }
    }
}
