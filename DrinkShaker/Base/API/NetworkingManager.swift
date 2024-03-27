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
    
    func request<T: Codable>(_ endpoint: Endpoints, type: T.Type) async throws -> T {
        
        let request = URLRequest(url: endpoint.url)
//        print("Request: \(request)")
        
        let (data, response) = try await URLSession.shared.data(for: request)

        // Check the response status code
        guard let response = response as? HTTPURLResponse, (200...300) ~= response.statusCode else {
            let statusCode = (response as! HTTPURLResponse).statusCode
            throw NetworkingError.invalidStatusCode(statusCode: statusCode)
        }

        let decoder = JSONDecoder()
        let decodedData = try decoder.decode(T.self, from: data)
//        print("res: \(decodedData)")
        return decodedData
                
    }
    
    func request(_ endpoint: Endpoints) async throws {
        
        let request = URLRequest(url: endpoint.url)
        
        let (_, response) = try await URLSession.shared.data(for: request)
        
        // Check the response status code
        guard let response = response as? HTTPURLResponse, (200...300) ~= response.statusCode else {
            let statusCode = (response as! HTTPURLResponse).statusCode
            throw NetworkingError.invalidStatusCode(statusCode: statusCode)
        }
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

