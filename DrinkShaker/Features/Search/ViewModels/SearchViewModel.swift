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
    
    func getDrinksByFirstLetter (letter: String) {
        print("Letter in SearchViewModel is \(letter)")
    }
    
}
