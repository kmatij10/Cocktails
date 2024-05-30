//
//  RootView.swift
//  Cocktails
//
//  Created by Kristina Matijasic on 30.05.2024..
//

import Foundation
import SwiftUI

struct RootView: View {
    
    var body: some View {
        NavigationStack {
            DrinkListView(viewModel: DrinkListViewModel())
        }
    }
}
