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
    
    func request<T: Codable>(_ absoluteURL: String, type: T.Type, completion: @escaping (Result<T, Error>) -> Void) {
        
        guard let url = URL(string: absoluteURL) else {
            completion(.failure(NetworkingError.invalidUrl))
            return
        }
        
        let request = URLRequest(url: url)
        
        let dataTask = URLSession.shared.dataTask(with: request) { data, response, error in
            print("In dataTask")
            // Check for errors
            if error != nil {
                completion(.failure(NetworkingError.custom(error: error!)))
            }
            // Check the response status code
            guard let response = response as? HTTPURLResponse, (200...300) ~= response.statusCode else {
                let statusCode = (response as! HTTPURLResponse).statusCode
                completion(.failure(NetworkingError.invalidStatusCode(statusCode: statusCode)))
                return
            }
            // Check if the data is nil
            guard let data = data else {
                completion(.failure(NetworkingError.invalidData))
                return
            }
            // Decode data, return data if valid
            do {
                let decoder = JSONDecoder()
                let res = try decoder.decode(T.self, from: data)
                completion(.success(res))
            } catch {
                completion(.failure(NetworkingError.failedToDecode(error: error)))
            }
        }
        
        dataTask.resume()
        
    }
}

extension NetworkingManager {
    enum NetworkingError: LocalizedError {
        case invalidUrl
        case custom(error: Error)
        case invalidStatusCode(statusCode: Int)
        case invalidData
        case failedToDecode(error: Error)
    }
}

extension NetworkingManager.NetworkingError {
    var errorDescription: String? {
        switch self {
        case .invalidUrl:
            return "The URL is invalid"
        case .invalidStatusCode:
            return "Status code falls into the wrong range"
        case .invalidData:
            return "Response data is invalid"
        case .failedToDecode:
            return "Failed to decode data"
        case .custom(let error):
            return "Something went wrong \(error.localizedDescription)"
        }
    }
}
