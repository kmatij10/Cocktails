//
//  DrinkCell.swift
//  Cocktails
//
//  Created by Kristina Matijasic on 29.05.2024..
//

import Foundation
import SwiftUI
import Kingfisher

struct DrinkCell: View {
    let model: DrinkCellModel
    
    var body: some View {
        HStack(alignment: .center, spacing: 24) {
            KFImage(model.imageUrl)
                .resizable()
                .placeholder {
                    Color.gray
                }
                .fade(duration: 0.5)
                .cancelOnDisappear(true)
                .aspectRatio(contentMode: .fit)
                .cornerRadius(24)
                .clipped()
                .frame(width: 88, alignment: .leading)
            
            VStack(alignment: .leading, spacing: 8) {
                if let name = model.name {
                    Text(name)
                        .lineLimit(2)
                        .foregroundColor(.black)
                }
                if let des = model.desc {
                    Text(des)
                        .lineLimit(2)
                        .foregroundColor(.black)
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding(12)
        .background(Color.white)
    }
}
