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
    let onSearch: (String) -> Void
    
    @State private var isFocused = false
    
    var body: some View {
        VStack {
            HStack(spacing: 10) {
                SearchBarView(
                    searchText: $searchText,
                    isFocused: $isFocused,
                    onClear: { searchText = "" },
                    onSearch: onSearch
                )
                if !isFocused {
                    Image.filterImage
                        .resizable()
                        .frame(width: 18, height: 18)
                        .padding(.leading, 10)
                }
            }
            .animation(.easeInOut(duration: 0.5), value: isFocused)
            .padding(.top, 16)
            .padding(.bottom, 8)
            .padding(.horizontal, 16)
        }
        .background(Color.blue)
        .foregroundColor(.white)
        .padding(.top, 40)
    }
}
