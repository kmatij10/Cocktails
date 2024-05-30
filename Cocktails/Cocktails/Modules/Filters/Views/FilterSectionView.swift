//
//  FilterSectionView.swift
//  Cocktails
//
//  Created by Kristina Matijasic on 30.05.2024..
//

import Foundation
import SwiftUI

struct FilterSectionView<Item: FilterItem>: View {
    let title: String
    let items: [Item]
    let selectedItem: Item?
    let onSelect: (Item) -> Void
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text(title).bold()
            LazyVStack(spacing: 15) {
                ForEach(items, id: \.id) { item in
                    RadioButtonView(
                        title: item.title ?? "",
                        isSelected: selectedItem?.id == item.id
                    ) {
                        onSelect(item)
                    }
                }
            }
            DrinkDividerView()
                .padding(.vertical, 10)
        }
    }
}
