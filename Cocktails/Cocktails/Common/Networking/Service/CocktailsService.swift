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
}
