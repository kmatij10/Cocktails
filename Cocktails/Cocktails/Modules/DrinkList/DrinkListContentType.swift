//
//  DrinkListContentType.swift
//  Cocktails
//
//  Created by Kristina Matijasic on 30.05.2024..
//

import Foundation

enum DrinkListContentType {
    case content(drinks: [Drink])
    case loading
    case error
    case empty
}
