//
//  DIYDogsModel.swift
//  TheBrewBoard
//
//  Created by Paolo Baeli on 24/01/23.
//

import Foundation

protocol DIYDogsFetcher {
    func fetchDIYDogs(page: Int) async -> [Beer]
}

//CODE EXECUTED ON MAIN THREAD
@MainActor

final class DIYDogsViewModel: ObservableObject {
    //REFACTORED VARIABLES FROM DIYDOGSVIEW
    @Published private(set) var beers: [Beer] = []
    @Published private(set) var viewState: ViewState?
    
    private let diyDogFetcher: DIYDogsFetcher
    private(set) var page: Int = 1
    
    var isLoading: Bool {
        viewState == .loading
    }
    
    var isFetching: Bool {
        viewState == .fetching
    }
    
    //INIT VM
    init(
        diyDogFetcher: DIYDogsFetcher
    ) {
        self.diyDogFetcher = diyDogFetcher
    }
    
    //FETCHING BEERS
    func fetchDIYDogs() async {
        viewState = .loading
        
        page = 1
        
        defer { viewState = .finished }
        
        self.beers = await diyDogFetcher.fetchDIYDogs(page: page)
    }
    
    //FETCH MORE BEERS
    func fetchMoreDIYDogs() async {
        viewState = .fetching
        
        defer { viewState = .finished }
        
        page += 1
        
        self.beers += await diyDogFetcher.fetchDIYDogs(page: page)
    }
    
    //CHECK THIRD ELEMENT FROM LAST OF BEER'S LIST
    func hasReachedEnd(of DIYDog: Beer) -> Bool {
        let thirdFromLastIndex: Int = beers.count - 3
        return beers[thirdFromLastIndex].id == DIYDog.id
    }
    
    
}

extension DIYDogsViewModel {
    enum ViewState {
        case loading
        case fetching
        case finished
    }
}
