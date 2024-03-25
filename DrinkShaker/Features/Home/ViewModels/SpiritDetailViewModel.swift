//
//  SpiritDetailViewModel.swift
//  DrinkShaker
//
//  Created by Thomas Cowern on 3/22/24.
//

import Foundation

final class SpiritDetailViewModel: ObservableObject {
    
    @Published var spiriteDetail: Ingredient?
    
    func getSpiritDetails(spiritName: String?) {
        
        if let spiritName = spiritName {
            NetworkingManager.shared.request("https://www.thecocktaildb.com/api/json/v2/1/search.php?i=\(spiritName)", type: Ingredients.self) { res in
                DispatchQueue.main.async {
                    switch res {
                    case .success(let data):
                        self.spiriteDetail = data.ingredients.first
                        print("SOTD: ", self.spiriteDetail ?? "No SOTD")
                    case .failure(let error):
                        print(error)
                    }
                }
            }
        }
    }
}
