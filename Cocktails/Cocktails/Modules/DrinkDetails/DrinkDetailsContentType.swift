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

extension DrinkDetailsContentType: Equatable {
    static func == (lhs: DrinkDetailsContentType, rhs: DrinkDetailsContentType) -> Bool {
        switch (lhs, rhs) {
        case (.error, .error):
            return true
        case (.loading, .loading):
            return true
        case (.content(let lhsItem), .content(let rhsItem)):
            return lhsItem == rhsItem
        default:
            return false
        }
    }
}
