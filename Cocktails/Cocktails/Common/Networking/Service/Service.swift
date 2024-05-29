//
//  Service.swift
//  Cocktails
//
//  Created by Kristina Matijasic on 29.05.2024..
//

import Foundation
import Alamofire
import RxSwift

final class Service {
    
    static let shared = Service()
    
    private init() { }
}

extension Service {
    
    func request<T: Decodable>(
        router: Router,
        decoder: JSONDecoder = JSONDecoder(),
        additionalValidator: ((DataRequest) -> (DataRequest))? = nil
    ) -> Single<T> {
        return Single.just(CocktailsSessionManager.session)
            .map { $0.request(router) }
            .flatMap { $0.rx.responseDecodableObject(decoder: decoder) }
    }
    
    func request<T: Decodable>(_: T.Type, router: Router, decoder: JSONDecoder = JSONDecoder()) -> Single<T> {
        return request(router: router, decoder: decoder)
    }
}
