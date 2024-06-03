//
//  ServiceMock.swift
//  CocktailsTests
//
//  Created by Kristina Matijasic on 02.06.2024..
//

import Foundation
import RxSwift
@testable import Cocktails

class ServiceMock: DrinksServiceProtocol {
    var shouldReturnEmpty = false
    var shouldReturnError = false
    var drinksMock = DrinksMock()
    
    func getRandomDrink() -> RxSwift.Single<Cocktails.Drinks> {
        if shouldReturnError {
            return Single.error(NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "Mocked error"]))
        } else if shouldReturnEmpty {
            return Single.just(Drinks(drinks: []))
        }
        let drinks = drinksMock.randomDrink
        return .just(drinks)
    }
    
    func getDrink(id: String) -> RxSwift.Single<Cocktails.Drinks> {
        if shouldReturnError {
            return Single.error(NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "Mocked error"]))
        } else if shouldReturnEmpty {
            return Single.just(Drinks(drinks: []))
        }
        let drinks = drinksMock.selectedDrink
        return .just(drinks)
    }
    
    func getCategories() -> RxSwift.Single<Cocktails.CategoryList> {
        if shouldReturnError {
            return Single.error(NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "Mocked error"]))
        } else if shouldReturnEmpty {
            return Single.just(CategoryList(drinks: []))
        }
        let drinks = drinksMock.categories
        return .just(drinks)
    }
    
    func getGlass() -> RxSwift.Single<Cocktails.GlassList> {
        if shouldReturnError {
            return Single.error(NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "Mocked error"]))
        } else if shouldReturnEmpty {
            return Single.just(GlassList(drinks: []))
        }
        let drinks = drinksMock.glass
        return .just(drinks)
    }
    
    func getAlcoholic() -> RxSwift.Single<Cocktails.AlcoholicList> {
        if shouldReturnError {
            return Single.error(NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "Mocked error"]))
        } else if shouldReturnEmpty {
            return Single.just(AlcoholicList(drinks: []))
        }
        let drinks = DrinksMock().alcoholic
        return .just(drinks)
    }
    
    func getFilteredDrinks(category: String?, glass: String?, alcoholic: String?) -> Single<Drinks> {
        if shouldReturnError {
            return Single.error(NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "Mocked error"]))
        } else if shouldReturnEmpty {
            return Single.just(Drinks(drinks: []))
        }
        let drinks = drinksMock.filteredDrinks
        return .just(drinks)
    }

    func getDrinks(search: String) -> Single<Drinks> {
        if shouldReturnError {
            return Single.error(NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "Mocked error"]))
        } else if shouldReturnEmpty {
            return Single.just(Drinks(drinks: []))
        }
        if search == "margarita" {
            let drinks = drinksMock.drinksSearch
            return .just(drinks)
        } else {
            let drinks = drinksMock.drinks
            return .just(drinks)
        }
    }
}
