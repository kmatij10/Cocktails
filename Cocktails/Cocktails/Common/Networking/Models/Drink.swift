//
//  Drink.swift
//  Cocktails
//
//  Created by Kristina Matijasic on 29.05.2024..
//

import Foundation

import Foundation

struct Drink: Codable {
    let idDrink: String
    let strDrink: String?
    let strCategory: String?
    let strAlcoholic: String?
    let strGlass: String?
    let strInstructions: String?
    let strDrinkThumb: String?
    let dateModified: String?
}

struct Drinks: Codable {
    let drinks: [Drink]?
}
