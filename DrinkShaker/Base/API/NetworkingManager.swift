//
//  NetworkingManager.swift
//  DrinkShaker
//
//  Created by Thomas Cowern on 3/20/24.
//

import Foundation

final class NetworkingManager {
    
    static let shared = NetworkingManager()
    
    private init() {
        
    }
    
    func request(_ absoluteURL: String) {
        
        let url = URL(string: absoluteURL)
        
        let request = URLRequest(url: url!)
        
        let dataTask = URLSession.shared.dataTask(with: request) { data, response, error in
            // Check for errors
            if error != nil {
                return
            }
            // Check the response status code
            guard let response = response as? HTTPURLResponse, (200...300) ~= response.statusCode else {
                return
            }
            // Check if the data is nil
            guard let data = data else {
                return
            }
            
            do {
                let decoder = JSONDecoder()
            } catch {
                
            }
        }
        
        dataTask.resume()
        
    }
}
