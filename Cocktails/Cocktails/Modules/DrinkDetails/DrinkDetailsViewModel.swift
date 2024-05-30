//
//  DrinkDetailsViewModel.swift
//  Cocktails
//
//  Created by Kristina Matijasic on 30.05.2024..
//

import Foundation

final class DrinkDetailsViewModel: ObservableObject {
    
    private let drink: Drink?

    init(drink: Drink?) {
        self.drink = drink
    }
    
    var drinkModel: Drink? {
        drink
    }
    
    var category: String {
        drink?.category ?? ""
    }
    
    var alcoholic: String {
        drink?.alcoholic ?? ""
    }
    
    var glass: String {
        drink?.glass ?? ""
    }
    
    var ingredientWithMeasures: [String] {
        drink?.ingredientsWithMeasures ?? []
    }
}
