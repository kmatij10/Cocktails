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
    
    enum CocktailsLookup {
        
        static let path = "/lookup.php"
        
        static func drink(with id: String) -> Router {
            return Router(path: path, params: [Constants.QueryParameters.id: id])
        }
    }
    
    enum CocktailsFilters {
        
        static let path = "/list.php"
        
        static func filter(type: FilterType) -> Router {
            return Router(path: path, params: [type.rawValue: "list"])
        }
    }
    
    enum CocktailsFilter {
        static let path = "/filter.php"
        
        static func filterDrinks(category: String?, glass: String?, alcoholic: String?) -> Router {
            var params: [String: String] = [:]
                
            if let category = category {
                params["c"] = category
            }
            if let glass = glass {
                params["g"] = glass
            }
            if let alcoholic = alcoholic {
                params["a"] = alcoholic
            }
            
            return Router(
                path: path,
                params: params
            )
        }
    }
}
