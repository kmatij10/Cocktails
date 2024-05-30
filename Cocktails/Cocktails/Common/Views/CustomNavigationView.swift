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

    init(title: String, backButtonClick: (() -> Void)? = nil) {
        self.title = title
        self.backButtonClick = backButtonClick
    }

    var body: some View {
        ZStack {
            HStack(spacing: 0) {
                if let backButtonClick {
                    Button(action: { backButtonClick() }) {
                        Image(systemName: "chevron.left")
                            .frame(width: 24)
                            .foregroundColor(.white)
                    }
                }
                Spacer()
            }
            HStack(spacing: 0) {
                Text(title)
                    .foregroundColor(.white)
            }
        }
        .padding(.top, 66)
        .padding(.bottom, 14)
        .background(Color.blue)
    }
}
