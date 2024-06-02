//
//  FiltersView.swift
//  Cocktails
//
//  Created by Kristina Matijasic on 30.05.2024..
//

import Foundation
import SwiftUI

import SwiftUI

struct FiltersView: View {
    @ObservedObject var viewModel = FiltersViewModel()
    @EnvironmentObject private var navigationRouter: NavigationRouter
    
    var body: some View {
        VStack(spacing: 0) {
            CustomNavigationView(
                title: "Filters",
                backButtonClick: {
                    navigationRouter.pop()
                },
                resetButtonClick: {
                    viewModel.resetFilters()
                },
                resetButtonEnabled: viewModel.isFilterEnabled
            )
            switch viewModel.contentType {
            case .content(let categories, let glass, let alcoholic):
                createContent(categories: categories, glasses: glass, alcoholTypes: alcoholic)
                DrinkMainButtonView(
                    title: "SEARCH",
                    action: {
                        let filters = Filters(
                            category: viewModel.selectedCategory,
                            glass: viewModel.selectedGlass,
                            alcoholic: viewModel.selectedAlcoholType
                        )
                        navigationRouter.push(to: .drinkList(filters: filters))
                    },
                    isEnabled: viewModel.isFilterEnabled
                )
                .padding(.bottom, 50)
                .padding(.horizontal, 24)
            case .loading:
                EmptyDrinkView(title: "Something yummy is on your way!")
            case .error:
                EmptyDrinkView(title: "Something went wrong!")
            }
        }
        .background(Color.white)
        .edgesIgnoringSafeArea(.all)
        .navigationBarHidden(true)
    }
}

private extension FiltersView {
    
    @ViewBuilder
    func createContent(categories: [CategoryItem], glasses: [GlassItem], alcoholTypes: [AlcoholicItem]) -> some View {
        ScrollView(.vertical) {
            VStack(spacing: 0) {
                FilterSectionView(title: "Category", items: categories, selectedItem: viewModel.selectedCategory) { item in
                    viewModel.toggleSelection(for: .category, item: item)
                }
                FilterSectionView(title: "Glass", items: glasses, selectedItem: viewModel.selectedGlass) { item in
                    viewModel.toggleSelection(for: .glass, item: item)
                }
                FilterSectionView(title: "Alcoholic", items: alcoholTypes, selectedItem: viewModel.selectedAlcoholType) { item in
                    viewModel.toggleSelection(for: .alcoholic, item: item)
                }
            }
            .padding(24)
        }
    }
}
