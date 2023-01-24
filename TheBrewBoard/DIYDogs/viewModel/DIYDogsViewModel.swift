//
//  DIYDogsModel.swift
//  TheBrewBoard
//
//  Created by Paolo Baeli on 24/01/23.
//

import Foundation

protocol DIYDogFetcher {
    func fetchDIYDogs(page: Int) async -> [Beer]
}

@MainActor

final class DIYDogsViewModel: ObservableObject {
    @Published var isLoading: Bool
    @Published var hasMoreDIYDogs = true
    private let diyDogFetcher: DIYDogFetcher
    
    private(set) var page: Int = 1
    
    init(
        isLoading: Bool = true,
        diyDogFetcher: DIYDogFetcher
    ) {
        self.isLoading = isLoading
        self.diyDogFetcher = diyDogFetcher
    }
    
    //FETCHING BEERS
    func fetchDIYDogs() async {
        isLoading = true
        let beers = await diyDogFetcher.fetchDIYDogs(page: page)
        isLoading = false
        hasMoreDIYDogs = !beers.isEmpty
    }
    
    func fetchMoreDIYDogs() async {
        page += 1
        await fetchDIYDogs()
    }
}
