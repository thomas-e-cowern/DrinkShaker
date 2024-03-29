//
//  PopularDrinksViewModel.swift
//  DrinkShaker
//
//  Created by Thomas Cowern on 3/26/24.
//

import Foundation

final class PopularDrinksViewModel: ObservableObject {
    
    // Variables
    @Published private(set) var popularDrinks: [Drink] = []
    
    // Error handing
    @Published private(set) var error: NetworkingManager.NetworkingError?
    @Published var hasError = false
    
    func getPopularDrinks() async {
        // 1. Get the api key from config file
        if let apiKey = Bundle.main.infoDictionary?["API_KEY"] as? String {
            
            // 2. Make the network request
            do {
                let PDRequest = try await NetworkingManager.shared.request(.popularDrinks(apiKey: apiKey), type: CocktailDBAPIResponse.self)
                DispatchQueue.main.async {
                    self.popularDrinks = PDRequest.drinks
                }
            } catch {
                print("Problem in request for popular drinks: \(error.localizedDescription)")
            }
        } else {
            print("Something went wrong")
        }
    }
}
