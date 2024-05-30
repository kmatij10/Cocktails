//
//  DrinkIngredientsView.swift
//  Cocktails
//
//  Created by Kristina Matijasic on 30.05.2024..
//

import Foundation
import SwiftUI

struct DrinkIngredientsView: View {
    let ingredientsWithMeasures: [String]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Ingredients:")
                .font(.headline)
            ForEach(Array(ingredientsWithMeasures.enumerated()), id: \.offset) { _, ingredient in
                HStack(spacing: 10) {
                    Color.black
                        .clipShape(Circle())
                        .frame(width: 8, height: 8)
                    Text(ingredient)
                        .foregroundColor(.black)
                }
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.horizontal, 24)
    }
}
