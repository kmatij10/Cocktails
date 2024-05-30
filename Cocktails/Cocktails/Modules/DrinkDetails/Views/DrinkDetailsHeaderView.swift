//
//  DrinkDetailsHeaderView.swift
//  Cocktails
//
//  Created by Kristina Matijasic on 30.05.2024..
//

import Foundation
import SwiftUI
import Kingfisher

struct DrinkDetailsHeader: View {
    let imageUrl: URL?
    
    var body: some View {
        VStack(spacing: 0) {
            KFImage(imageUrl)
                .resizable()
                .placeholder {
                    Color.gray
                }
                .fade(duration: 0.5)
                .cancelOnDisappear(true)
                .scaledToFill()
                .clipped()
                .frame(height: 300)
        }
    }
}
