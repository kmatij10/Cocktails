//
//  DynamicCodingKey.swift
//  Cocktails
//
//  Created by Kristina Matijasic on 30.05.2024..
//

import Foundation

struct DynamicCodingKey: CodingKey {
    var stringValue: String
    var intValue: Int?

    init(stringValue: String) {
        self.stringValue = stringValue
        self.intValue = nil
    }

    init?(intValue: Int) {
        return nil
    }
}
