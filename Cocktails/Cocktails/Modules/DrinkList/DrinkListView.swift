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
    @State private var showDetails = false
    @State private var drinkDetailsModelId: String?
    
    var body: some View {
        VStack(spacing: 0) {
            switch viewModel.contentType {
            case .content(let drinks):
                HeaderView(searchText: $searchText, onSearch: viewModel.onSearch(string:))
                ZStack(alignment: .bottom) {
                    createcontent(drinks: drinks)
                    DrinkMainButtonView(
                        title: "FEELING LUCKY",
                        action: {
                            drinkDetailsModelId = nil
                            showDetails = true
                        }
                    )
                    .padding(.bottom, 50)
                    .padding(.horizontal, 24)
                }
            case .loading:
                EmptyDrinkView(title: "Something yummy is on your way!")
            case .error:
                HeaderView(searchText: $searchText, onSearch: viewModel.onSearch(string:))
                EmptyDrinkView(title: "Something went wrong!")
            case .empty:
                HeaderView(searchText: $searchText, onSearch: viewModel.onSearch(string:))
                EmptyDrinkView(title: "There are no drinks at the moment!")
            }
        }
        .scrollDismissesKeyboard(.immediately)
        .background(Color.white)
        .edgesIgnoringSafeArea(.all)
        .navigationDestination(
            isPresented: $showDetails,
            destination: {
                let viewModel = DrinkDetailsViewModel(id: drinkDetailsModelId)
                DrinkDetailView(viewModel: viewModel)
            }
        )
    }
}

private extension DrinkListView {
    
    @ViewBuilder
    func createcontent(drinks: [Drink]) -> some View {
        List {
            ForEach(drinks) { model in
                DrinkCell(
                    model: model,
                    action: {
                        drinkDetailsModelId = model.id
                        showDetails = true
                    }
                )
                .listRowInsets(EdgeInsets())
            }
            .listRowSeparator(.hidden)
        }
        .padding(.bottom, 30)
        .listStyle(.plain)
    }
}
