//
//  Drink.swift
//  Cocktails
//
//  Created by Kristina Matijasic on 29.05.2024..
//

import Foundation

struct Drink: Decodable, Identifiable, Equatable {
    let id: String
    let drinkName: String?
    let category: String?
    let alcoholic: String?
    let glass: String?
    let instructions: String?
    let drinkImage: String?
    let dateModified: String?
    let ingredients: [String]
    let measures: [String]

    enum CodingKeys: String, CodingKey {
        case idDrink, strDrink, strCategory, strAlcoholic, strGlass, strInstructions, strDrinkThumb, dateModified
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.id = try container.decode(String.self, forKey: .idDrink)
        self.drinkName = try? container.decodeIfPresent(String.self, forKey: .strDrink)
        self.category = try? container.decodeIfPresent(String.self, forKey: .strCategory)
        self.alcoholic = try? container.decodeIfPresent(String.self, forKey: .strAlcoholic)
        self.glass = try? container.decodeIfPresent(String.self, forKey: .strGlass)
        self.instructions = try? container.decodeIfPresent(String.self, forKey: .strInstructions)
        self.drinkImage = try? container.decodeIfPresent(String.self, forKey: .strDrinkThumb)
        self.dateModified = try? container.decodeIfPresent(String.self, forKey: .dateModified)

        var ingredients: [String] = []
        var measures: [String] = []
        
        let dynamicContainer = try decoder.container(keyedBy: DynamicCodingKey.self)

        for i in 1...15 {
            let ingredientKey = DynamicCodingKey(stringValue: "strIngredient\(i)")
            let measureKey = DynamicCodingKey(stringValue: "strMeasure\(i)")
                    
            if let ingredient = try? dynamicContainer.decodeIfPresent(String.self, forKey: ingredientKey) {
                ingredients.append(ingredient)
            }
                    
            if let measure = try? dynamicContainer.decodeIfPresent(String.self, forKey: measureKey) {
                measures.append(measure)
            }
        }

        self.ingredients = ingredients
        self.measures = measures
    }
}

extension Drink {
    
    var ingredientsWithMeasures: [String] {
        return zip(measures, ingredients).map { "\($0.trimmingCharacters(in: .whitespacesAndNewlines)) \($1.trimmingCharacters(in: .whitespacesAndNewlines))" }
    }
    
    var ingredientsPreview: String {
        ingredients.joined(separator: ", ")
    }
    
    var imageUrl: URL? {
        let str = "\(drinkImage ?? "")/preview"
        return URL(string: str)
    }
}

struct Drinks: Decodable {
    let drinks: [Drink]?
}
