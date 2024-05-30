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
