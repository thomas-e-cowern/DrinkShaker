//
//  NewestDrinksViewModel.swift
//  DrinkShaker
//
//  Created by Thomas Cowern on 3/26/24.
//

import Foundation

final class NewestDrinksViewModel: ObservableObject {
    
    // Variables
    @Published private(set) var newestDrinks: [Drink] = []
    
    // Error Handling
    @Published private(set) var error: NetworkingManager.NetworkingError?
    @Published var hasError = false
    
    func getNewestDrinks() async {
        if let apiKey = Bundle.main.infoDictionary?["API_KEY"] as? String {
            
            // 2. Make the network request
            do {
                let NDRequest = try await NetworkingManager.shared.request(.newestDrinks(apiKey: apiKey), type: CocktailDBAPIResponse.self)
                newestDrinks = NDRequest.drinks
            } catch {
                print("Problem in request for newest drinks: \(error.localizedDescription)")
            }
        } else {
            print("Something went wrong")
        }
    }
}

