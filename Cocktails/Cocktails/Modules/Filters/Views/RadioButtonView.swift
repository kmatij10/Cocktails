//
//  RadioButtonView.swift
//  Cocktails
//
//  Created by Kristina Matijasic on 30.05.2024..
//

import Foundation
import SwiftUI

struct RadioButtonView: View {
    let title: String
    let isSelected: Bool
    let action: () -> Void
    
    var body: some View {
        HStack {
            isSelected ? Image.radioSelected : Image.radioNotSelected
            Text(title)
            Spacer()
        }
        .onTapGesture {
            action()
        }
    }
}
