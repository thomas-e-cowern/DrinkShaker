//
//  SearchViewModel.swift
//  DrinkShaker
//
//  Created by Thomas Cowern on 5/7/24.
//

import Foundation

final class SearchViewModel: ObservableObject {
    
    @Published private(set) var searchDrinks: [Drink] = []
    
    @Published private(set) var error: NetworkingManager.NetworkingError?
    @Published var hasError = false
    
    func getDrinksByFirstLetter (letter: String) async {
        print("Letter in SearchViewModel is \(letter)")
        // 1. Get the api key from config file
        if let apiKey = Bundle.main.infoDictionary?["API_KEY"] as? String {
            
            // 2. Make the network request
            do {
                let PDRequest = try await NetworkingManager.shared.request(.searchDrinks(apiKey: apiKey, searchTerm: letter), type: CocktailDBAPIResponse.self)
                DispatchQueue.main.async {
                    self.searchDrinks = PDRequest.drinks
                    print("Searched Drinks: \(self.searchDrinks)")
                }
            } catch {
                print("Problem in request for popular drinks: \(error.localizedDescription)")
            }
        } else {
            print("Something went wrong")
        }
    }
    
}
