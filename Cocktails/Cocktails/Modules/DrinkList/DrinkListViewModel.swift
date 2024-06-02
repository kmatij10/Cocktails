//
//  DrinkListViewModel.swift
//  Cocktails
//
//  Created by Kristina Matijasic on 29.05.2024..
//

import Foundation
import SwiftUI
import RxSwift
import RxCocoa

final class DrinkListViewModel: ObservableObject {
    
    @Published var contentType: DrinkListContentType = .loading
    
    private let searchText = BehaviorSubject<String>(value: "")
    private let filters: Filters?
    private let disposeBag = DisposeBag()
    
    private let service: Service.Cocktails

    init(service: Service.Cocktails = .shared, filters: Filters?) {
        self.service = service
        self.filters = filters
        if let filters {
            fetchFilteredDrinks(
                category: filters.category?.strCategory,
                glass: filters.glass?.strGlass,
                alcoholic: filters.alcoholic?.strAlcoholic
            )
        } else {
            setupBinding()
        }
    }
    
    var isFromFilters: Bool {
        filters != nil
    }
    
    func onSearch(string: String) {
        searchText.onNext(string)
    }
}

private extension DrinkListViewModel {
    
    func setupBinding() {
        searchText
            .debounce(.milliseconds(500), scheduler: MainScheduler.instance)
            .distinctUntilChanged()
            .flatMapLatest { [weak self] searchText -> Observable<DrinkListContentType> in
                guard let self else { return Observable.just(.error) }
                return service
                    .getDrinks(search: searchText)
                    .asObservable()
                    .map { model in
                        if let drinks = model.drinks {
                            return .content(drinks: drinks)
                        } else {
                            return .empty
                        }
                    }
            }
            .asDriver(onErrorJustReturn: .error)
            .drive(onNext: { [weak self] in
                self?.contentType = $0
            })
            .disposed(by: disposeBag)
    }
    
    func fetchFilteredDrinks(category: String?, glass: String?, alcoholic: String?) {
        service
            .getFilteredDrinks(category: category, glass: glass, alcoholic: alcoholic)
            .map { [weak self] model -> DrinkListContentType in
                guard let self else { return .error }
                if let drinks = model.drinks {
                    return .content(drinks: drinks)
                } else {
                    return .empty
                }
            }
            .asDriver(onErrorJustReturn: .error)
            .drive(onNext: { [weak self] in
                self?.contentType = $0
            })
            .disposed(by: disposeBag)
        
    }
}
