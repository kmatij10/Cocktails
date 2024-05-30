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
    @StateObject var viewModel: DrinkDetailsViewModel
    let key: UUID
    
    var body: some View {
        VStack(spacing: 0) {
            CustomNavigationView(
                title: viewModel.drinkTitle ?? "",
                backButtonClick: {
                    presentationMode.wrappedValue.dismiss()
                }
            )
            switch viewModel.contentType {
            case .content(let drink):
                createcontent(drink: drink)
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

private extension DrinkDetailView {
    
    @ViewBuilder
    func createcontent(drink: Drink) -> some View {
        ScrollView(.vertical) {
            VStack(spacing: 0) {
                DrinkDetailsHeader(imageUrl: drink.imageUrl)
                VStack(spacing: 16) {
                    DrinkTagsView(category: drink.category ?? "", alcoholic: drink.alcoholic ?? "", glass: drink.glass ?? "")
                    DrinkDividerView()
                    DrinkIngredientsView(ingredientsWithMeasures: drink.ingredientsWithMeasures)
                    DrinkDividerView()
                    DrinkInstructionsView(instructions: drink.instructions ?? "")
                    DrinkDividerView()
                    DrinkTimestampView(timestamp: viewModel.formattedTimestamp(from: drink.dateModified))
                }
                .frame(maxWidth: .infinity, alignment: .center)
                .background(Color.white)
                .cornerRadius(30)
                .padding(.top, -30)
                .padding(.bottom, 30)
            }
        }
    }
}
