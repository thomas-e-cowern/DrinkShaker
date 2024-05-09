//
//  RandomViewModel.swift
//  DrinkShaker
//
//  Created by Thomas Cowern on 5/8/24.
//

import Foundation

final class RandomViewModel: ObservableObject {
    @Published private(set) var drink: Drink?
    @Published private(set) var error: NetworkingManager.NetworkingError?
    @Published var hasError = false
    
    func getRandomDrink() async {
        
        // 1. Get the api key from config file
        if let apiKey = Bundle.main.infoDictionary?["API_KEY"] as? String {
            
            // 2. Make the network request
            do {
                let PDRequest = try await NetworkingManager.shared.request(.randomDrink(apiKey: apiKey), type: CocktailDBAPIResponse.self)
                DispatchQueue.main.async {
                    self.drink = PDRequest.drinks[0]
                }
            } catch {
                print("Problem in request for popular drinks: \(error.localizedDescription)")
                hasError = true
            }
        } else {
            print("Something went wrong")
        }
    }
}
