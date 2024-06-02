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
    @EnvironmentObject private var navigationRouter: NavigationRouter
    
    var body: some View {
        VStack(spacing: 0) {
            switch viewModel.contentType {
            case .content(let drinks):
                if !viewModel.isFromFilters {
                    createHeader()
                }
                ZStack(alignment: .bottom) {
                    createcontent(drinks: drinks)
                    if !viewModel.isFromFilters {
                        DrinkMainButtonView(
                            title: "FEELING LUCKY",
                            action: {
                                navigationRouter.push(to: .drinkDetails(id: nil))
                            }
                        )
                        .padding(.bottom, 50)
                        .padding(.horizontal, 24)
                    }
                }
            case .loading:
                EmptyDrinkView(title: "Something yummy is on your way!")
            case .error:
                if !viewModel.isFromFilters {
                    createHeader()
                }
                EmptyDrinkView(title: "Something went wrong!")
            case .empty:
                if !viewModel.isFromFilters {
                    createHeader()
                }
                EmptyDrinkView(title: "There are no drinks at the moment!")
            }
        }
        .scrollDismissesKeyboard(.immediately)
        .background(Color.white)
        .edgesIgnoringSafeArea(.all)
        .navigationBarHidden(true)
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
                        navigationRouter.push(to: .drinkDetails(id: model.id))
                    }
                )
                .listRowInsets(EdgeInsets())
            }
            .listRowSeparator(.hidden)
        }
        .padding(.bottom, 30)
        .listStyle(.plain)
    }
    
    @ViewBuilder
    func createHeader() -> some View {
        HeaderView(
            searchText: $searchText,
            onSearch: viewModel.onSearch,
            filterAction: {
                navigationRouter.push(to: .filters)
            }
        )
    }
}
