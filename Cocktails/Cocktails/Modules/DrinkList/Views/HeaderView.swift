//
//  HeaderView.swift
//  Cocktails
//
//  Created by Kristina Matijasic on 29.05.2024..
//

import Foundation
import SwiftUI

struct HeaderView: View {
    @Binding var searchText: String
    
    var body: some View {
        VStack {
            HStack {
                TextField("Search", text: $searchText)
                    .padding(10)
                    .background(Color.white)
                    .cornerRadius(8)
                    .shadow(radius: 4)
                    .padding(.horizontal, 16)
                    .foregroundColor(.black)
            }
            .padding(.top, 16)
            .padding(.bottom, 8)
        }
        .background(Color.blue)
        .foregroundColor(.white)
    }
}
