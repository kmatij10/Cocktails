//
//  DrinkDetailsView.swift
//  Cocktails
//
//  Created by Kristina Matijasic on 30.05.2024..
//

import Foundation
import SwiftUI

struct DrinkDetailView: View {
    @Environment(\.presentationMode) private var presentationMode: Binding<PresentationMode>
    let viewModel: DrinkDetailsViewModel
    
    var body: some View {
        VStack(spacing: 0) {
            CustomNavigationView(
                title: viewModel.drinkModel?.drinkName ?? "",
                backButtonClick: {
                    presentationMode.wrappedValue.dismiss()
                }
            )
            ScrollView(.vertical) {
                VStack(spacing: 0) {
                    DrinkDetailsHeader(imageUrl: viewModel.drinkModel?.imageUrl)
                    VStack(spacing: 16) {
                        DrinkTagsView(category: viewModel.category, alcoholic: viewModel.alcoholic, glass: viewModel.glass)
                        DrinkDividerView()
                        DrinkIngredientsView(ingredientsWithMeasures: viewModel.ingredientWithMeasures)
                        DrinkDividerView()
                        DrinkInstructionsView(instructions: viewModel.drinkModel?.instructions ?? "")
                        DrinkDividerView()
                        DrinkTimestampView()
                    }
                    .frame(maxWidth: .infinity, alignment: .center)
                    .background(Color.white)
                    .cornerRadius(30)
                    .padding(.top, -30)
                    .padding(.bottom, 30)
                }
            }
        }
        .background(Color.white)
        .edgesIgnoringSafeArea(.all)
        .navigationBarHidden(true)
    }
}
