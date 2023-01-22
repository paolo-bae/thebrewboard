//
//  RequestProtocol.swift
//  TheBrewBoard
//
//  Created by Paolo Baeli on 21/01/23.
//

import Foundation

protocol RequestProtocol {
    //Endpoint
    var path: String { get }
    //Headers and parameters to send with the request (params will act as request's body)
    var headers: [String: String] { get }
    var params: [String: Any] { get }
    //Query parameters to attach in the URL
    var urlParams: [String: String?] { get }
    //All the request will specify their type using RequestType
    var requestType: RequestType { get }
}

//Definition of a default implementation of RequestProtocol
extension RequestProtocol {
    var host: String {
        APIConstants.host
    }
    
    var params: [String: Any] {
        [:]
    }
    
    var urlParams: [String: String?] {
        [:]
    }
    
    var headers: [String: String] {
        [:]
    }

    func createURLRequest() throws -> URLRequest {
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
        
        urlRequest.setValue("application/json",
            forHTTPHeaderField: "Content-Type")
        
        if !params.isEmpty {
            urlRequest.httpBody = try JSONSerialization.data(withJSONObject: params)
        }
        
        //DEBUG
        print ("\(urlRequest)")
        return urlRequest
    }
}

