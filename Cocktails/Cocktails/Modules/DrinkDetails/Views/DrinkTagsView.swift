//
//  DrinkTagsView.swift
//  Cocktails
//
//  Created by Kristina Matijasic on 30.05.2024..
//

import Foundation
import SwiftUI

struct DrinkTagsView: View {
    let category: String
    let alcoholic: String
    let glass: String
    
    var body: some View {
        VStack(spacing: 0) {
            HStack(alignment: .top, spacing: 50) {
                VStack(spacing: 5) {
                    ZStack {
                        Color.gray
                            .clipShape(Circle())
                            .frame(width: 50, height: 50)
                        Image.categoryImage
                            .resizable()
                            .foregroundColor(.black)
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 20)
                    }
                    Text(category)
                        .multilineTextAlignment(.center)
                        .foregroundColor(.black)
                }
                .frame(width: 70)
                VStack(spacing: 5) {
                    ZStack {
                        Color.gray
                            .clipShape(Circle())
                            .frame(width: 50, height: 50)
                        Image.glassImage
                            .resizable()
                            .foregroundColor(.black)
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 20)
                    }
                    Text(glass)
                        .multilineTextAlignment(.center)
                        .foregroundColor(.black)
                }
                .frame(width: 70)
                VStack(spacing: 5) {
                    ZStack {
                        Color.gray
                            .clipShape(Circle())
                            .frame(width: 50, height: 50)
                        Image.alcoholicImage
                            .resizable()
                            .foregroundColor(.black)
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 20)
                    }
                    Text(alcoholic)
                        .multilineTextAlignment(.center)
                        .foregroundColor(.black)
                }
                .frame(width: 70)
            }
        }
        .padding(.top, 20)
    }
}
