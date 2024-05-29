//
//  Router.swift
//  Cocktails
//
//  Created by Kristina Matijasic on 29.05.2024..
//

import Foundation
import Alamofire

struct Router {
    
    private static let base = Constants.URL.baseUrl
    
    private let base: String
    private let path: String
    private let method: HTTPMethod
    private let headers: HTTPHeaders?
    private let encodableParams: [RequestEncodableParams]
    
    private init(
        base: String,
        path: String,
        method: HTTPMethod,
        headers: HTTPHeaders?,
        encodableParams: [RequestEncodableParams]
    ) {
        self.base = base
        self.path = path
        self.method = method
        self.headers = headers
        self.encodableParams = encodableParams
    }
    
    init(
        path: String,
        method: HTTPMethod = .get,
        params: Parameters? = nil,
        encoding: ParameterEncoding = URLEncoding.default,
        headers: HTTPHeaders? = nil
    ) {
        self.init(
            base: Router.base,
            path: path,
            method: method,
            headers: headers,
            encodableParams: [EncodableParams(encoding: encoding, parameters: params)]
        )
    }
}

extension Router: URLRequestConvertible {
    
    private func pathURL() throws -> URL {
        if path.starts(with: "http") {
            return try path.asURL()
        }
        return try base.asURL()
            .appendingPathComponent(path)
    }

    func asURLRequest() throws -> URLRequest {
        let url = try pathURL()
        var request = try URLRequest(url: url, method: method, headers: headers)
        try encodableParams.forEach { request = try $0.encode(request) }
        return request
    }
}
