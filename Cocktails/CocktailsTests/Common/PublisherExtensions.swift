//
//  PublisherExtensions.swift
//  CocktailsTests
//
//  Created by Kristina Matijasic on 02.06.2024..
//

import Foundation
import RxSwift
import Combine

extension Published.Publisher {
    func asObservable() -> Observable<Value> {
        let subject = ReplaySubject<Value>.create(bufferSize: 1)
        
        let cancellable = self.sink(
            receiveCompletion: { _ in
                subject.onCompleted()
            },
            receiveValue: { value in
                subject.onNext(value)
            }
        )
        
        return subject.do(onDispose: {
            cancellable.cancel()
        })
    }
}
