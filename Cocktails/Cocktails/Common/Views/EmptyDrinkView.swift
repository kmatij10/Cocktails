//
//  EmptyDrinkView.swift
//  Cocktails
//
//  Created by Kristina Matijasic on 30.05.2024..
//

import Foundation
import SwiftUI

struct EmptyDrinkView: View {
    let title: String
    
    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            VStack(spacing: 20) {
                Text(title)
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                Image.cocktailImage
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50, height: 50)
                    .foregroundColor(.white)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.blue)
        .edgesIgnoringSafeArea(.all)
    }
}
