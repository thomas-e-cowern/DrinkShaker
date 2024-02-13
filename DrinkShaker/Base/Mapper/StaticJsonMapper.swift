//
//  StaticJsonMapper.swift
//  DrinkShaker
//
//  Created by Thomas Cowern on 2/13/24.
//

import Foundation

struct StaticJsonMapper {
    
    static func decode<T: Decodable>(file: String, type: T.Type) throws -> T {
        print("Inside JSON static mapper")
        guard let path = Bundle.main.path(forResource: file, ofType: "json"), let data = FileManager.default.contents(atPath: path) else {
            print("Error in path")
            throw MappingError.failedToLoadContents
        }
        
        let decoder = JSONDecoder()
        let decodedData = try decoder.decode(T.self, from: data)
        print("Decoded data: \(decodedData)")
        return decodedData
    }
}

extension StaticJsonMapper {
    enum MappingError: Error {
        case failedToLoadContents
    }
}
