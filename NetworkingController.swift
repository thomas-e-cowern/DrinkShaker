//
//  NetworkingController.swift
//  DrinkShaker
//
//  Created by Thomas Cowern on 9/8/22.
//

import Foundation
import Combine

func fetch(_ url: URL) {
    URLSession.shared.dataTask(with: url) { data, response, error in
        if let error = error {
            print("There was an error fetching data: \(error.localizedDescription)")
        } else if let data = data {
            // decode and print
        }
    }.resume()
}
