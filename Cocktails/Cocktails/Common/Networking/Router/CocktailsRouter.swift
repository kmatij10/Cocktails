//
//  CocktailsRouter.swift
//  Cocktails
//
//  Created by Kristina Matijasic on 29.05.2024..
//

import Foundation

extension Router {
    
    enum CocktailsSearch {
        
        static let path = "/search.php"
        
        static func all(with search: String) -> Router {
            return Router(path: path, params: [Constants.QueryParameters.search: search])
        }
    }
    
    enum CocktailsRandom {
        
        static let path = "/random.php"
        
        static func drink() -> Router {
            return Router(path: path)
        }
    }
}
