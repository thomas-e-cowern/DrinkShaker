//
//  DrinkOfTheDayViewModel.swift
//  DrinkShaker
//
//  Created by Thomas Cowern on 3/26/24.
//

import Foundation

final class DrinkOfTheDayViewModel: ObservableObject {
    
    @Published var drinkOfTheDayDetails: Ingredient?
    
    func getDrinkOfTheDay(drinkName: String) {
        print("In drink of the day")
        if let apiKey = Bundle.main.infoDictionary?["API_KEY"] as? String {
            
            // 2. Make the network request
            NetworkingManager.shared.request(.drinkOfTheDayDetail(apiKey: apiKey, searchTerm: drinkName), type: Ingredients.self) { [weak self] res in
                DispatchQueue.main.async {
                    switch res {
                        // 3. update the array with the data
                    case .success(let data):
                        self?.drinkOfTheDayDetails = data.ingredients.first
                        print("DOTD: ", self?.drinkOfTheDayDetails ?? "No DOTD")
                    case .failure(let error):
                        print("DOTD Error: ", error)
                    }
                }
            }
        } else {
            print("Something went wrong getting a random drink")
        }
    }
}
