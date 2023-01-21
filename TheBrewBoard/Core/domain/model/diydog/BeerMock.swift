//
//  BeerMock.swift
//  TheBrewBoard
//
//  Created by Paolo Baeli on 19/01/23.
//

import Foundation

// MARK: - Mock data
extension Beer {
    static let mock = loadBeers()
}

private struct BeersMock: Codable {
    let beers: [Beer]
}

private func loadBeers() -> [Beer] {
    guard let url = Bundle.main.url(
        forResource: "BeersMock",
        withExtension: "json"
    ), let data = try? Data(contentsOf: url) else { return [] }
    let decoder = JSONDecoder()
    
    decoder.keyDecodingStrategy = .convertFromSnakeCase
    let jsonMock = try? decoder.decode(BeersMock.self, from: data)
    
    return jsonMock?.beers ?? []
}
