//
//  SpiritDetailViewModel.swift
//  DrinkShaker
//
//  Created by Thomas Cowern on 3/22/24.
//

import Foundation

final class SpiritDetailViewModel: ObservableObject {
    
    @Published var spiritDetail: Ingredient?
    
    func getSpiritDetails(spiritName: String?) {
        // 1. Get the api key from config file
        if let apiKey = Bundle.main.infoDictionary?["API_KEY"] as? String {
            
            
            if let spiritName = spiritName {
                NetworkingManager.shared.request(.spiritDetail(apiKey: apiKey, searchTerm: spiritName), type: Ingredients.self) { res in
                    DispatchQueue.main.async {
                        switch res {
                        case .success(let data):
                            self.spiritDetail = data.ingredients.first
                            print("SOTD: ", self.spiritDetail ?? "No SOTD")
                        case .failure(let error):
                            print(error)
                        }
                    }
                }
            }
        }
    }
}
