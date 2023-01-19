//
//  RequestProtocol.swift
//  TheBrewBoard
//
//  Created by Paolo Baeli on 19/01/23.
//

import Foundation

protocol RequestProtocol {
    var path: String { get }
    
    var headers: [String: String] { get }
    var params: [String: Any] { get }
    
    var urlParams: [String: String?] { get }
    
    var addAuthorizationionToken: Bool { get }
    
    var requestType: RequestType { get }
}
