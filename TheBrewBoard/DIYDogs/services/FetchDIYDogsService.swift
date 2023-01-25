//
//  FetchDIYDogsService.swift
//  TheBrewBoard
//
//  Created by Paolo Baeli on 24/01/23.
//

import Foundation

struct FetchDIYDogsService {
    private let requestManager: RequestManagerProtocol
    
    init(requestManager: RequestManagerProtocol) {
        self.requestManager = requestManager
    }
}

// MARK: - DIYDogs fetcher

extension FetchDIYDogsService: DIYDogsFetcher {
    
    func fetchDIYDogs(page: Int) async -> [Beer] {
        let requestData = DIYDogsRequest.getDIYDogsBy(page: page)
        do {
            let beers: [Beer] = try await requestManager.perform(requestData)
            return beers
        } catch {
            print(error)
            return []
        }
    }
}
