//
//  DrinkOfTheDayViewModel.swift
//  DrinkShaker
//
//  Created by Thomas Cowern on 3/26/24.
//

import Foundation

final class DrinkOfTheDayViewModel: ObservableObject {
    
    @Published var drinkOfTheDayDetails: Ingredient?
    
    func getDrinkOfTheDay(drinkName: String) async {
        print("In drink of the day")
        if let apiKey = Bundle.main.infoDictionary?["API_KEY"] as? String {
            
            //             2. Make the network request
            if let apiKey = Bundle.main.infoDictionary?["API_KEY"] as? String {
                
                // 2. Make the network request
//                do {
//                    drinkOfTheDay = try await NetworkingManager.shared.request(.randomDrink(apiKey: apiKey), type: [CocktailDBAPIResponse].self)
//                    print("res: \(drinkOfTheDay)")
//                } catch {
//                    print("Problem in get random drink")
//                }
            } else {
                print("Something went wrong getting a random drink")
            }
        }
    }
}
