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
    
    func fetch(_ url: URL) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("There was an error fetching data: \(error.localizedDescription)")
            } else if let data = data {
                let decoder = JSONDecoder()
                
                do {
                    let recipe = try decoder.decode(Recipe.self, from: data)
                } catch  {
                    print("The recipe call resulted in an error: \(error.localizedDescription)")
                }
            }
        }.resume()
    }
}
