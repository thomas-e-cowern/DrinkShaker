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
    
    func getPopularDrinks() {
        // 1. Get the api key from config file
        if let apiKey = Bundle.main.infoDictionary?["API_KEY"] as? String {
            
            // 2. Make the network request
            NetworkingManager.shared.request("https://www.thecocktaildb.com/api/json/v2/\(apiKey)/popular.php", type: CocktailDBAPIResponse.self) { [weak self] res in
                DispatchQueue.main.async {
                    switch res {
                        // 3. update the array with the data
                    case .success(let data):
                        self?.popularDrinks = data.drinks
                        print("Popular drinks", self?.popularDrinks ?? "No popular drinks")
                    case .failure(let error):
                        print(error)
                        self?.hasError = true
                        self?.error = error as? NetworkingManager.NetworkingError
                    }
                }
            }
        } else {
            print("Something went wrong")
        }
    }
}
