//
//  DrinkMainButtonView.swift
//  Cocktails
//
//  Created by Kristina Matijasic on 30.05.2024..
//

import Foundation
import SwiftUI

struct MainButtonStyle: ButtonStyle {
    var isEnabled: Bool = true

    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundColor(.white)
            .frame(maxWidth: .infinity)
            .frame(height: 50)
            .background(Color.blue)
            .cornerRadius(25)
            .opacity(isEnabled ? 1.0 : 0.5)
            .scaleEffect(configuration.isPressed ? 0.9 : 1.0)
    }
}

extension ButtonStyle where Self == MainButtonStyle {
    static func primaryButtonStyle(isEnabled: Bool) -> MainButtonStyle {
        MainButtonStyle(isEnabled: isEnabled)
    }
}

struct DrinkMainButtonView: View {
    let title: String
    let action: () -> Void
    var isEnabled: Bool = true

    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.headline)
        }
        .buttonStyle(.primaryButtonStyle(isEnabled: isEnabled))
        .disabled(!isEnabled)
    }
}
