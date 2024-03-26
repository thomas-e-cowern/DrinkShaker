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
    
    func getNewestDrinks() {
        if let apiKey = Bundle.main.infoDictionary?["API_KEY"] as? String {
            
            // 2. Make the network request
            NetworkingManager.shared.request(.newestDrinks(apiKey: apiKey), type: CocktailDBAPIResponse.self) { [weak self] res in
                DispatchQueue.main.async {
                    switch res {
                        // 3. update the array with the data
                    case .success(let data):
                        self?.newestDrinks = data.drinks
                        print("Popular drinks", self?.newestDrinks ?? "No new drinks")
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

