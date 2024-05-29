//
//  DrinkListViewModel.swift
//  Cocktails
//
//  Created by Kristina Matijasic on 29.05.2024..
//

import Foundation
import SwiftUI
import RxSwift

final class DrinkListViewModel: ObservableObject {
    
    @Published var drinks: [DrinkCellModel] = []
    
    private let searchText = BehaviorSubject<String>(value: "")
    private let disposeBag = DisposeBag()
    
    private let service: Service.Cocktails

    init(service: Service.Cocktails = .shared) {
        self.service = service
        setupBinding()
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
            .flatMapLatest { [weak self] searchText -> Observable<[DrinkCellModel]> in
                guard let self else { return Observable.just([]) }
                return service
                    .getDrinks(search: searchText)
                    .asObservable()
                    .map { $0.drinks.map { DrinkCellModel(model: $0) } }
            }
            .subscribe(onNext: { [weak self] in
                self?.drinks = $0
            })
            .disposed(by: disposeBag)
    }
}
