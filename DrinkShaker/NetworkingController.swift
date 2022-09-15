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
    
    @Published var drinkRecipes: [RecipeModel] = []
    @Published var randomRecipe: RecipeModel?
    
    func fetchDrinkRecipes(drinkName: String) {
        
        let drinkName = drinkName
        
        let drinkUrlString = "https://www.thecocktaildb.com/api/json/v1/1/search.php?s=\(drinkName)"
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
                            if let recipes = try? decoder.decode(Recipes.self, from: data) {
//                                print("👉 👉 👉 Recipes: \(recipes)")
                               for recipe in recipes.drinks {
//                                    print("👉 👉 👉 \(recipe)")
                                   self.drinkRecipes.append(recipe)
                                }
//                                print("👉 👉 👉 Recipes: \(self.drinkRecipes)")
                                
                            } else {
                                print("There was a problem decoding the data: \(error?.localizedDescription ?? "Error in data")")
                            }
                        }
                    }
                }
            }.resume()
        }
    }
    
    func fetchRandomDrinkRecipe() {
        let randomDrinkUrl = "https://www.thecocktaildb.com/api/json/v1/1/random.php"
        if let url = URL(string: randomDrinkUrl) {
            URLSession.shared.dataTask(with: url) { data, response, error in
                DispatchQueue.main.async {
                    if let error = error {
                        print("There was an error with data from the drink DB: \(error.localizedDescription)")
                    } else {
                        let decoder = JSONDecoder()
                        decoder.keyDecodingStrategy = .convertFromSnakeCase
                        
                        if let data = data {
                            print("Data: \(data)")
                            if let recipes = try? decoder.decode(Recipes.self, from: data) {
//                                print("👉 👉 👉 Recipes: \(recipes)")
                               for recipe in recipes.drinks {
//                                    print(recipe)
                                   self.drinkRecipes.append(recipe)
                                   self.randomRecipe = recipe
                                }
//                                print("👉 👉 👉 Recipes: \(self.drinkRecipes)")
                            } else {
                                print("There was a problem decoding random drink: \(error?.localizedDescription ?? "Error in data")")
                            }
                        }
                    }
                }
            }.resume()
        }
    }
}
