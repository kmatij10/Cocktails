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
    
    @Published var drinks: [Drink] = []
    private let disposeBag = DisposeBag()
    
    private let service: Service.Cocktails

    init(service: Service.Cocktails = .shared) {
        self.service = service
        
        service
            .getDrinks(search: "")
            .asObservable()
            .map { $0.drinks }
            .subscribe(onNext: { [weak self] in
                self?.drinks = $0
            })
            .disposed(by: disposeBag)
    }
}
