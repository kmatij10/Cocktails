//
//  DrinkCellModel.swift
//  Cocktails
//
//  Created by Kristina Matijasic on 29.05.2024..
//

import Foundation

struct DrinkCellModel: Identifiable {
    
    private let model: Drink
    
    init(model: Drink) {
        self.model = model
    }
    
    var id: String {
        model.idDrink
    }
    
    var name: String? {
        model.strDrink
    }
    
    var desc: String? {
        model.strAlcoholic
    }
    
    var imageUrl: URL? {
        let str = "\(model.strDrinkThumb ?? "")/preview"
        return URL(string: str)
    }
}
