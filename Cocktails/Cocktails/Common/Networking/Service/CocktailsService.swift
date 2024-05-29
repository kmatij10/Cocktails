//
//  CocktailsService.swift
//  Cocktails
//
//  Created by Kristina Matijasic on 29.05.2024..
//

import Foundation
import RxSwift

protocol BetshopsServiceProtocol {
    func getDrinks(search: String) -> Single<Drinks>
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

extension Service.Cocktails: BetshopsServiceProtocol {
    
    func getDrinks(search: String) -> Single<Drinks> {
        return service
            .request(Drinks.self, router: .CocktailsSearch.all(with: search))
    }
}
