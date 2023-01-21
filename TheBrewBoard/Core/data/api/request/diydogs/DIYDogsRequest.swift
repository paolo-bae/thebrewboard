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
        "/beers"
    }
    
    var urlParams: [String: String?] {
        switch self {
        case let .getDIYDogsBy(page):
            var params = ["page": String(page)]
            return params
        }
    }
    
    var requestType: RequestType {
        .GET
    }
}
