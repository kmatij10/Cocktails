//
//  FilterItems.swift
//  Cocktails
//
//  Created by Kristina Matijasic on 30.05.2024..
//

import Foundation

protocol FilterItem {
    var id: UUID { get }
    var title: String? { get }
}

struct CategoryItem: Decodable, Identifiable, Equatable, FilterItem {
    var id = UUID()
    let strCategory: String?

    enum CodingKeys: String, CodingKey {
        case strCategory
    }
    
    var title: String? {
        strCategory
    }
}

struct CategoryList: Decodable {
    let drinks: [CategoryItem]?
}

struct GlassItem: Decodable, Identifiable, Equatable, FilterItem {
    var id = UUID()
    let strGlass: String?

    enum CodingKeys: String, CodingKey {
        case strGlass
    }
    
    var title: String? {
        strGlass
    }
}

struct GlassList: Decodable {
    let drinks: [GlassItem]?
}

struct AlcoholicItem: Decodable, Identifiable, Equatable, FilterItem {
    var id = UUID()
    let strAlcoholic: String?

    enum CodingKeys: String, CodingKey {
        case strAlcoholic
    }
    
    var title: String? {
        strAlcoholic
    }
}

struct AlcoholicList: Decodable {
    let drinks: [AlcoholicItem]?
}
