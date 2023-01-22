//
//  BeersRequest.swift
//  TheBrewBoard
//
//  Created by Paolo Baeli on 21/01/23.
//
import Foundation

enum DIYDogsRequest: RequestProtocol {
    
    case getDIYDogsBy(page: Int)
    
    var path: String {
        "/v2/beers"
    }
    
    var urlParams: [String: String?] {
        switch self {
        case let .getDIYDogsBy(page):
            let params = ["page": String(page)]
            return params
        }
    }
    
    var requestType: RequestType {
        .GET
    }
}
