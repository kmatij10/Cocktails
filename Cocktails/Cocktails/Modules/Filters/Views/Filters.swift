//
//  Filters.swift
//  Cocktails
//
//  Created by Kristina Matijasic on 02.06.2024..
//

import Foundation

struct Filters: Equatable {
    static func == (lhs: Filters, rhs: Filters) -> Bool {
        lhs.category == rhs.category &&
        lhs.glass == rhs.glass &&
        lhs.alcoholic == rhs.alcoholic
    }
    
    let category: CategoryItem?
    let glass: GlassItem?
    let alcoholic: AlcoholicItem?
}
