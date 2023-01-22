//
//  APIManager.swift
//  TheBrewBoard
//
//  Created by Paolo Baeli on 21/01/23.
//

import Foundation

protocol APIManagerProtocol {
    func perform(_ request: RequestProtocol) async throws -> Data
}

class APIManager: APIManagerProtocol {
    private let urlSession: URLSession
    
    init(urlSession: URLSession = URLSession.shared) {
        self.urlSession = urlSession
    }
    
    func perform(_ request: RequestProtocol) async throws -> Data {
        let (data, response) = try await urlSession.data(for: request.createURLRequest())
        
        guard let httpResponse = response as? HTTPURLResponse,
              httpResponse.statusCode == 200 else {
                throw NetworkError.invalidServerResponse }
        //DEBUG
        print("\(httpResponse)")
        //print("\(String(decoding: data, as: UTF8.self))")
        return data
    }
}
