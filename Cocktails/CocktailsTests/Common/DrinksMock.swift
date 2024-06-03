//
//  DrinksMock.swift
//  CocktailsTests
//
//  Created by Kristina Matijasic on 02.06.2024..
//

import Foundation
@testable import Cocktails

class DrinksMock {
    
    var randomDrink: Drinks {
        let drinks = try? JSONDecoder().decode(Drinks.self, from: MockHelpers.loadJsonFile(named: "RandomDrink"))
        return drinks!
    }
    
    var selectedDrink: Drinks {
        let drinks = try? JSONDecoder().decode(Drinks.self, from: MockHelpers.loadJsonFile(named: "SelectedDrink"))
        return drinks!
    }
    
    var categories: CategoryList {
        let drinks = try? JSONDecoder().decode(Cocktails.CategoryList.self, from: MockHelpers.loadJsonFile(named: "Category"))
        return drinks!
    }
    
    var glass: GlassList {
        let drinks = try? JSONDecoder().decode(Cocktails.GlassList.self, from: MockHelpers.loadJsonFile(named: "Glass"))
        return drinks!
    }
    
    var alcoholic: AlcoholicList {
        let drinks = try? JSONDecoder().decode(Cocktails.AlcoholicList.self, from: MockHelpers.loadJsonFile(named: "Alcoholic"))
        return drinks!
    }
    
    var filteredDrinks: Drinks {
        let drinks = try? JSONDecoder().decode(Drinks.self, from: MockHelpers.loadJsonFile(named: "FilteredDrinks"))
        return drinks!
    }

    var drinks: Drinks {
        let drinks = try? JSONDecoder().decode(Drinks.self, from: MockHelpers.loadJsonFile(named: "Drinks"))
        return drinks!
    }
    
    var drinksSearch: Drinks {
        let drinks = try? JSONDecoder().decode(Drinks.self, from: MockHelpers.loadJsonFile(named: "DrinksSearch"))
        return drinks!
    }
}
