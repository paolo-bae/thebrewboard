//
//  DIYDogsFetcherMock.swift
//  TheBrewBoard
//
//  Created by Paolo Baeli on 24/01/23.
//

import Foundation

struct DIYDogsFetcherMock: DIYDogsFetcher {
  func fetchDIYDogs(page: Int) async -> [Beer] {
    Beer.mock
  }
}
