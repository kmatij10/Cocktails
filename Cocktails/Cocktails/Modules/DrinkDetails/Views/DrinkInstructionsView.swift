//
//  DrinkInstructionsView.swift
//  Cocktails
//
//  Created by Kristina Matijasic on 30.05.2024..
//

import Foundation
import SwiftUI

struct DrinkInstructionsView: View {
    let instructions: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Directions:")
                .font(.headline)
                .foregroundColor(.black)
            Text(instructions)
                .foregroundColor(.black)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.horizontal, 24)
    }
}
