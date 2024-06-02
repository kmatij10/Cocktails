//
//  Route.swift
//  Cocktails
//
//  Created by Kristina Matijasic on 02.06.2024..
//

import Foundation
import SwiftUI

enum Route {
    case drinkList(filters: Filters?)
    case filters
    case drinkDetails(id: String?)
}

extension Route: Hashable {
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(self.hashValue)
    }
    
    static func == (lhs: Route, rhs: Route) -> Bool {
        switch (lhs, rhs) {
        case (.drinkList(let lhsItem), .drinkList(let rhsItem)):
            return lhsItem == rhsItem
        case (.drinkDetails(let lhsItem), .drinkDetails(let rhsItem)):
            return lhsItem == rhsItem
        case (.filters, .filters):
            return true
        default:
            return false
        }
    }
}

extension Route: View {
    
    var body: some View {
        switch self {
        case .drinkDetails(let id):
            let viewModel = DrinkDetailsViewModel(id: id)
            DrinkDetailView(viewModel: viewModel)
        case .filters:
            let viewModel = FiltersViewModel()
            FiltersView(viewModel: viewModel)
        case .drinkList(let filters):
            let viewModel = DrinkListViewModel(filters: filters)
            DrinkListView(viewModel: viewModel)
        }
    }
}
