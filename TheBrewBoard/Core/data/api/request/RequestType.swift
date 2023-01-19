//
//  RequestType.swift
//  TheBrewBoard
//
//  Created by Paolo Baeli on 19/01/23.
//

import Foundation

enum RequestType: String {
    case GET
    case POST
}

    func createURLRequest(authToken: String) throws -> URLRequest {
        var components = URLComponents()
        components.scheme = "https"
        components.host = host
        components.path = path
        
        if !urlParams.isEmpty {
            components.queryItems = urlParams.map {
                URLQueryItem(name: $0, value: $1)
            }
        }
        
        guard let url = components.url else { throw NetworkError.invalidURL }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = requestType.rawValue
        
        if !headers.isEmpty {
            urlRequest.allHTTPHeaderFields = headers
        }
        
        if addAutorizationToken {
            urlRequest.setValue(authToken,
                forHTTPHeaderField: "Authorization")
        }
        
        urlRequest.setValue("application/json",
            forHTTPHeaderField: "Content-Type")
        
        if !params.isEmpty {
            urlRequest.httpBody = try JSONSerialization.data(withJSONObject: params)
        }
        
        return urlRequest
    }
}
