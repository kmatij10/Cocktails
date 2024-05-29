//
//  EncodableParams.swift
//  Cocktails
//
//  Created by Kristina Matijasic on 29.05.2024..
//

import Foundation
import Alamofire

protocol RequestEncodableParams {
    func encode(_ request: URLRequest) throws -> URLRequest
}

struct EncodableParams: RequestEncodableParams {

    private let encoding: ParameterEncoding
    private let parameters: Parameters?

    init(
        encoding: ParameterEncoding = URLEncoding.default,
        parameters: Parameters?
    ) {
        self.encoding = encoding
        self.parameters = parameters
    }

    func encode(_ request: URLRequest) throws -> URLRequest {
        return try encoding.encode(request, with: parameters)
    }
}
