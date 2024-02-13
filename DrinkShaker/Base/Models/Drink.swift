//
//  Drink.swift
//  DrinkShaker
//
//  Created by Thomas Cowern on 2/13/24.
//

import Foundation

struct Drink: Codable {
    let id: String
    let name: String
    let glass: String
    let alcohol: String
    let instructions: String
    let image: String
}

enum CodingKeys: String, CodingKey {
    case id = "idDrink"
    case name = "strDrink"
    case glass = "strGlass"
    case alcohol = "strAlcoholic"
    case instructions = "strInstructions"
    case image = "strDrinkThumb"
}
