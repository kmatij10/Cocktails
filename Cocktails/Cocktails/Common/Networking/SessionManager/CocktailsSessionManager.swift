//
//  CocktailsSessionManager.swift
//  Cocktails
//
//  Created by Kristina Matijasic on 29.05.2024..
//

import Foundation
import Alamofire

class CocktailsSessionManager {

    static var session: Session = {
        let configuration = URLSessionConfiguration.default
        configuration.httpAdditionalHeaders = HTTPHeaders.default.dictionary
        return Session(configuration: configuration)
    }()
    
    private init() {}
}
