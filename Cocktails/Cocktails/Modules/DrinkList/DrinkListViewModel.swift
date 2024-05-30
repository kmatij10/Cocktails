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
    @Published var drink: Drink?
    @Published var showRandomDetails = false
    
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
    
    func getRandomDrink() {
        fetchRandomDrink()
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
    
    func fetchRandomDrink() {
        service
            .getRandomDrink()
            .asObservable()
            .map { $0.drinks?.first }
            .subscribe(onNext: { [weak self] drink in
                self?.drink = drink
                self?.showRandomDetails = true
            })
            .disposed(by: disposeBag)
    }
}
