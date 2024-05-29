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
        List {
            HeaderView(searchText: $searchText)
                .onChange(of: searchText) {
                    viewModel.onSearch(string: searchText)
                }
            ForEach(viewModel.drinks) { model in
                DrinkCell(model: model)
            }
            .listRowSeparator(.hidden)
        }
        .listRowInsets(EdgeInsets())
        .listStyle(.plain)
    }
}
