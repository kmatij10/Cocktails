//
//  DrinkDetailsViewModel.swift
//  Cocktails
//
//  Created by Kristina Matijasic on 30.05.2024..
//

import Foundation
import RxSwift
import RxCocoa

final class DrinkDetailsViewModel: ObservableObject {
    
    @Published var contentType: DrinkDetailsContentType = .loading
    @Published var drinkTitle: String?
    private let service: Service.Cocktails
    private let disposeBag = DisposeBag()

    init(id: String?, service: Service.Cocktails = .shared) {
        self.service = service
        if let id {
            fetchDrink(id: id)
        } else {
            fetchRandomDrink()
        }
    }
}

private extension DrinkDetailsViewModel {
    
    func fetchRandomDrink() {
        service
            .getRandomDrink()
            .map { [weak self] model -> DrinkDetailsContentType in
                if let self, let drinkUnwrapped = model.drinks?.first {
                    drinkTitle = drinkUnwrapped.drinkName
                    return .content(drink: drinkUnwrapped)
                } else {
                    return .error
                }
            }
            .asDriver(onErrorJustReturn: .error)
            .drive(onNext: { [weak self] in
                self?.contentType = $0
            })
            .disposed(by: disposeBag)
    }
    
    func fetchDrink(id: String) {
        service
            .getDrink(id: id)
            .map { [weak self] model -> DrinkDetailsContentType in
                if let self, let drinkUnwrapped = model.drinks?.first {
                    drinkTitle = drinkUnwrapped.drinkName
                    return .content(drink: drinkUnwrapped)
                } else {
                    return .error
                }
            }
            .asDriver(onErrorJustReturn: .error)
            .drive(onNext: { [weak self] in
                self?.contentType = $0
            })
            .disposed(by: disposeBag)
    }
}
