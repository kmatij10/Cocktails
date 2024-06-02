//
//  MockHelpers.swift
//  CocktailsTests
//
//  Created by Kristina Matijasic on 02.06.2024..
//

import Foundation

class MockHelpers {
    
    static func loadJsonFile(named name: String) -> Data {
        let bundle = Bundle(for: DrinkListViewModelTests.self)
        guard let url = bundle.url(forResource: name, withExtension: "json") else {
            fatalError("Unable to locate \(name).json in bundle.")
        }
        do {
            return try Data(contentsOf: url)
        } catch {
            fatalError("Unable to load \(name).json from bundle:\n\(error)")
        }
    }
}
