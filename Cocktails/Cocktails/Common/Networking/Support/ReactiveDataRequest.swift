//
//  ReactiveDataRequest.swift
//  Cocktails
//
//  Created by Kristina Matijasic on 29.05.2024..
//

import Foundation
import Alamofire
import RxSwift

extension DataRequest: ReactiveCompatible {}

extension Reactive where Base == DataRequest {
    
    func responseDecodableObject<T: Decodable>(
        decoder: JSONDecoder = JSONDecoder()
    ) -> Single<T> {
        
        return Single<T>.create { [weak base] single -> Disposable in
            
            let request = base?.responseDecodable(
                decoder: decoder,
                completionHandler: { (response: DataResponse<T, AFError>) in
                    switch response.result {
                    case .success(let value): single(.success(value))
                    case .failure(let error):
                        single(.failure(error))
                    }
                }
            )
            
            return Disposables.create {
                request?.cancel()
            }
        }
    }
}
