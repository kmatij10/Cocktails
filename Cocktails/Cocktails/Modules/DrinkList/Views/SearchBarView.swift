//
//  SearchBarView.swift
//  Cocktails
//
//  Created by Kristina Matijasic on 30.05.2024..
//

import Foundation
import SwiftUI

struct SearchBarView: View {
    @Binding var searchText: String
    @Binding var isFocused: Bool
    let onClear: () -> Void
    let onSearch: (String) -> Void
    
    var body: some View {
        HStack(alignment: .center, spacing: 10) {
            Image.searchImage
                .resizable()
                .frame(width: 18, height: 18)
                .foregroundColor(.black)
                .padding(.leading, 10)
            SearchTextField(searchText: $searchText, isFocused: $isFocused, onClear: onClear)
                .onChange(of: searchText) {
                    onSearch(searchText)
                }
            
        }
        .background(Color.white)
        .cornerRadius(8)
    }
}

struct SearchTextField: View {
    @Binding var searchText: String
    @Binding var isFocused: Bool
    let onClear: () -> Void
    @FocusState private var isTextFieldFocused
    
    var body: some View {
        TextField("Search", text: $searchText)
            .foregroundColor(.black)
            .overlay(content: clearButton)
            .focused($isTextFieldFocused)
            .onChange(of: isTextFieldFocused) {
                isFocused = isTextFieldFocused
            }
            .padding(.vertical, 16)
            .padding(.trailing, 16)
    }
    
    private func clearButton() -> some View {
        HStack(spacing: 0) {
            Spacer()
            if !searchText.isEmpty {
                Button(action: onClear) {
                    Image.searchCancel
                        .resizable()
                        .foregroundColor(.black)
                        .frame(width: 10, height: 10)
                        .padding(6)
                }
                .background(.gray)
                .clipShape(Circle())
            }
        }
    }
}
