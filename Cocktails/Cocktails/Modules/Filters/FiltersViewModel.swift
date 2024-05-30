//
//  FiltersViewModel.swift
//  Cocktails
//
//  Created by Kristina Matijasic on 30.05.2024..
//

import Foundation
import SwiftUI
import RxSwift
import RxCocoa

class FiltersViewModel: ObservableObject {
    
    @Published var selectedCategory: CategoryItem?
    @Published var selectedGlass: GlassItem?
    @Published var selectedAlcoholType: AlcoholicItem?
    @Published var contentType: FiltersContentType = .loading
    
    private let service: Service.Cocktails
    private let disposeBag = DisposeBag()
    
    init(service: Service.Cocktails = .shared) {
        self.service = service
        setupBinding()
    }
    
    func resetFilters() {
        selectedCategory = nil
        selectedGlass = nil
        selectedAlcoholType = nil
    }
    
    var isFilterEnabled: Bool {
        selectedCategory != nil || selectedGlass != nil || selectedAlcoholType != nil
    }
    
    func toggleSelection(for filterType: FilterType, item: FilterItem) {
        switch filterType {
        case .category:
            selectedCategory = selectedCategory?.id == item.id ? nil : item as? CategoryItem
        case .glass:
            selectedGlass = selectedGlass?.id == item.id ? nil : item as? GlassItem
        case .alcoholic:
            selectedAlcoholType = selectedAlcoholType?.id == item.id ? nil : item as? AlcoholicItem
        }
    }
}

private extension FiltersViewModel {
    
    func setupBinding() {
        let fetchCategories = service.getCategories().asObservable()
        let fetchGlass = service.getGlass().asObservable()
        let fetchAlcoholic = service.getAlcoholic().asObservable()
        
        Observable.zip(fetchCategories, fetchGlass, fetchAlcoholic)
            .map { categories, glass, alcoholic -> FiltersContentType in
                guard let categoriesUnwrapped = categories.drinks,
                      let glassUnwrapped = glass.drinks,
                      let alcoholicUnwrapped = alcoholic.drinks
                else { return .error }
                return .content(categories: categoriesUnwrapped, glasses: glassUnwrapped, alcoholTypes: alcoholicUnwrapped)
            }
            .asDriver(onErrorJustReturn: .error)
            .drive(onNext: { [weak self] in
                self?.contentType = $0
            })
            .disposed(by: disposeBag)
    }
}
