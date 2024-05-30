//
//  DrinkListView.swift
//  Cocktails
//
//  Created by Kristina Matijasic on 29.05.2024..
//

import Foundation
import SwiftUI
import Kingfisher

struct DrinkListView: View {
    @StateObject var viewModel: DrinkListViewModel
    @State private var searchText = ""
    
    var body: some View {
        VStack(spacing: 0) {
            HeaderView(searchText: $searchText, onSearch: viewModel.onSearch(string:))
            List {
                ForEach(viewModel.drinks) { model in
                    DrinkCell(model: model)
                        .listRowInsets(EdgeInsets())
                }
                .listRowSeparator(.hidden)
            }
            .padding(.bottom, 30)
            .background(Color.white)
            .listStyle(.plain)
        }
        .scrollDismissesKeyboard(.immediately)
        .padding(.top, 40)
        .background(Color.white)
        .edgesIgnoringSafeArea(.all)
    }
}
