//
//  DIYDogsView.swift
//  TheBrewBoard
//
//  Created by Paolo Baeli on 21/01/23.
//

import SwiftUI

struct DIYDogsView: View {
    @State var beers: [Beer] = []
    @State var isLoading = true
    private let requestManager = RequestManager()

    var body: some View {
      NavigationView {
        List {
          ForEach(beers) { beer in
            DIYDogRow(beer: beer)
          }
        }
        .task {
          await fetchDIYDogs()
        }
        .listStyle(.plain)
        .navigationTitle("The brew board")
        .overlay {
          if isLoading {
            ProgressView("Bottling beers...")
          }
        }
        .refreshable {
            await fetchDIYDogs()
        }
      }
    }

    func fetchDIYDogs() async {
      do {
        let beers: [Beer] = try await requestManager.perform(DIYDogsRequest.getDIYDogsBy(page: 1))
        self.beers = beers
        await stopLoading()
      } catch {
          print("\(error)")
      }
        // DEBUG
        //rint("\(beers)")
    }

    @MainActor
    func stopLoading() async {
      isLoading = false
    }
  }

struct DIYDogsView_Previews: PreviewProvider {
    static var previews: some View {
        DIYDogsView(beers: Beer.mock, isLoading: false)
    }
}
