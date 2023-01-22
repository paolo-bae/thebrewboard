//
//  RequestManager.swift
//  TheBrewBoard
//
//  Created by Paolo Baeli on 21/01/23.
//

import Foundation

protocol RequestManagerProtocol {
    func perform<T: Decodable>(_ request: RequestProtocol) async throws -> T
}

final class RequestManager: RequestManagerProtocol {
    let apiManager: APIManagerProtocol
    let parser: DataParserProtocol
    
    init(
        apiManager: APIManagerProtocol = APIManager(),
        parser: DataParserProtocol = DataParser()
    ) {
        self.apiManager = apiManager
        self.parser = parser
    }
    
    func perform<T: Decodable>(_ request: RequestProtocol) async throws -> T {
        let data = try await apiManager.perform(request)
        //print("\(String(decoding: data, as: UTF8.self))")
        let decoded: T = try parser.parse(data: data) 
        
        //DEBUG
        print("\(String(decoding: data, as: UTF8.self))")
        print("\(decoded)")
        return decoded
    }
}
