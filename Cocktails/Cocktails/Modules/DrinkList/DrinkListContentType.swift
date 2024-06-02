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

extension DrinkListContentType: Equatable {
    static func == (lhs: DrinkListContentType, rhs: DrinkListContentType) -> Bool {
        switch (lhs, rhs) {
        case (.empty, .empty):
            return true
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
