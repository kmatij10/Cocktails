//
//  DrinkDetailsContentType.swift
//  Cocktails
//
//  Created by Kristina Matijasic on 30.05.2024..
//

import Foundation

enum DrinkDetailsContentType {
    case content(drink: Drink)
    case loading
    case error
}
