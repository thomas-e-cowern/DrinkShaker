//
//  NetworkingController.swift
//  DrinkShaker
//
//  Created by Thomas Cowern on 9/8/22.
//

import Foundation
import Combine
import SwiftUI

class NetworkingController: ObservableObject {
    
    @EnvironmentObject var dataController: DataController
    
    @Published var drinkRecipes: [Recipes] = []
    
    func fetchDrinkRecipes() {
        
        let drinkUrlString = "https://www.thecocktaildb.com/api/json/v1/1/search.php?s=margarita"
        if let url = URL(string: drinkUrlString) {
            URLSession.shared.dataTask(with: url) { data, response, error in
                DispatchQueue.main.async {
                    if let error = error {
                        print("There was an error with data from the drink DB: \(error.localizedDescription)")
                    } else {
                        let decoder = JSONDecoder()
                        decoder.keyDecodingStrategy = .convertFromSnakeCase
                        
                        if let data = data {
                            print("Data: \(data)")
                            if let recipes = try? decoder.decode([Recipes].self, from: data) {
                                print("👉 👉 👉 Recipes: \(recipes)")
                                self.drinkRecipes = recipes
                                print("👉 👉 👉 Recipes: \(self.drinkRecipes)")
                            } else {
                                print("There was a problem decoding the data: \(error?.localizedDescription ?? "Error in data")")
                            }
                        }
                    }
                }
            }.resume()
        }
    }
}
