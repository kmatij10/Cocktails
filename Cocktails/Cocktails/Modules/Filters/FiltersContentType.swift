//
//  FiltersContentType.swift
//  Cocktails
//
//  Created by Kristina Matijasic on 30.05.2024..
//

import Foundation

enum FiltersContentType {
    case content(categories: [CategoryItem], glasses: [GlassItem], alcoholTypes: [AlcoholicItem])
    case loading
    case error
}

extension FiltersContentType: Equatable {
    static func == (lhs: FiltersContentType, rhs: FiltersContentType) -> Bool {
        switch (lhs, rhs) {
        case (.error, .error):
            return true
        case (.loading, .loading):
            return true
        case (.content(let lhsItem1, let lhsItem2, let lhsItem3), .content(let rhsItem1, let rhsItem2, let rhsItem3)):
            return lhsItem1.map { $0.strCategory } == rhsItem1.map { $0.strCategory } &&
            lhsItem2.map { $0.strGlass } == rhsItem2.map { $0.strGlass } &&
            lhsItem3.map { $0.strAlcoholic } == rhsItem3.map { $0.strAlcoholic }
        default:
            return false
        }
    }
}
