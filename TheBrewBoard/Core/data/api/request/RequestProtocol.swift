//
//  RequestProtocol.swift
//  TheBrewBoard
//
//  Created by Paolo Baeli on 19/01/23.
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
    //If the request needs to add the authorization token
    var addAuthorizationionToken: Bool { get }
    //All the request will specify their type using RequestType
    var requestType: RequestType { get }
}

extension RequestProtocol {
    var host: String {
        APIConstants.host
    }

    var addAutorizationToken: Bool {
        false
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
    
