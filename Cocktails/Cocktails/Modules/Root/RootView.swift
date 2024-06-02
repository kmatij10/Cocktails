//
//  RootView.swift
//  Cocktails
//
//  Created by Kristina Matijasic on 30.05.2024..
//

import Foundation
import SwiftUI

struct RootView: View {
    @StateObject private var navigationRouter = NavigationRouter()
    
    var body: some View {
        NavigationStack(path: $navigationRouter.routes) {
            DrinkListView(viewModel: DrinkListViewModel(filters: nil))
                .navigationDestination(for: Route.self) { $0 }
        }
        .environmentObject(navigationRouter)
    }
}
