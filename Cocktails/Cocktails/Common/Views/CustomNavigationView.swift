//
//  CustomNavigationView.swift
//  Cocktails
//
//  Created by Kristina Matijasic on 30.05.2024..
//

import Foundation
import SwiftUI

struct CustomNavigationView: View {
    let title: String
    let backButtonClick: (() -> Void)?
    let resetButtonClick: (() -> Void)?
    let resetButtonEnabled: Bool

    init(title: String, backButtonClick: (() -> Void)? = nil, resetButtonClick: (() -> Void)? = nil, resetButtonEnabled: Bool = false) {
        self.title = title
        self.backButtonClick = backButtonClick
        self.resetButtonClick = resetButtonClick
        self.resetButtonEnabled = resetButtonEnabled
    }

    var body: some View {
        ZStack {
            HStack(spacing: 0) {
                if let backButtonClick {
                    Button(action: { backButtonClick() }) {
                        Image.backButton
                            .frame(width: 24)
                            .foregroundColor(.white)
                    }
                    .padding(.leading, 24)
                }
                Spacer()
            }
            HStack(spacing: 0) {
                Text(title)
                    .foregroundColor(.white)
            }
            HStack(spacing: 0) {
                if let resetButtonClick {
                    Spacer()
                    Button(action: { resetButtonClick() }) {
                        Text("Reset")
                            .foregroundColor(.white)
                    }
                    .disabled(!resetButtonEnabled)
                    .opacity(resetButtonEnabled ? 1.0 : 0.5)
                    .padding(.trailing, 24)
                }
            }
        }
        .padding(.top, 66)
        .padding(.bottom, 14)
        .background(Color.blue)
    }
}
