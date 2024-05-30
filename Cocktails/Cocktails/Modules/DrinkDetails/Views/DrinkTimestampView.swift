//
//  DrinkTimestampView.swift
//  Cocktails
//
//  Created by Kristina Matijasic on 30.05.2024..
//

import Foundation
import SwiftUI

struct DrinkTimestampView: View {
    let timestamp: String
    
    var body: some View {
        ModifiedText(timestamp: timestamp)
            .padding(.horizontal, 24)
            .frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct ModifiedText: View {
    let timestamp: String
    
    var body: some View {
        Text("Last modified: ")
            .bold() +
        Text(timestamp)
    }
}
