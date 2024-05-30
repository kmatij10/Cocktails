//
//  CocktailsService.swift
//  Cocktails
//
//  Created by Kristina Matijasic on 29.05.2024..
//

import Foundation
import RxSwift

protocol DrinksServiceProtocol {
    func getDrinks(search: String) -> Single<Drinks>
    func getRandomDrink() -> Single<Drinks>
    func getDrink(id: String) -> Single<Drinks>
    func getCategories() -> Single<CategoryList>
    func getGlass() -> Single<GlassList>
    func getAlcoholic() -> Single<AlcoholicList>
}

extension Service {
    
    final class Cocktails {
        
        static let shared = Cocktails()
        
        private let service: Service
        
        private init(service: Service = .shared) {
            self.service = service
        }
    }
}

extension Service.Cocktails: DrinksServiceProtocol {
    
    func getDrinks(search: String) -> Single<Drinks> {
        return service
            .request(Drinks.self, router: .CocktailsSearch.all(with: search))
    }
    
    func getRandomDrink() -> Single<Drinks> {
        return service
            .request(Drinks.self, router: .CocktailsRandom.drink())
    }
    
    func getDrink(id: String) -> Single<Drinks> {
        return service
            .request(Drinks.self, router: .CocktailsLookup.drink(with: id))
    }
    
    func getCategories() -> Single<CategoryList> {
        return service
            .request(CategoryList.self, router: .CocktailsFilters.filter(type: .category))
    }
    
    func getGlass() -> Single<GlassList> {
        return service
            .request(GlassList.self, router: .CocktailsFilters.filter(type: .glass))
    }
    
    func getAlcoholic() -> Single<AlcoholicList> {
        return service
            .request(AlcoholicList.self, router: .CocktailsFilters.filter(type: .alcoholic))
    }
}
