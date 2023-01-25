//
//  DIYDogsView.swift
//  TheBrewBoard
//
//  Created by Paolo Baeli on 21/01/23.
//

import SwiftUI
import ModalView

struct DIYDogsView: View {
    @ObservedObject var vm: DIYDogsViewModel
    
    var body: some View {
        NavigationView {
            ModalPresenter {
                List() {
                    ForEach(vm.beers) { beer in
                        ModalLink(destination: DIYDogDetailView(beer: beer)) {
                            DIYDogRow(beer: beer)
                                .task {
                                    if vm.hasReachedEnd(of: beer) && !vm.isFetching{
                                        await vm.fetchMoreDIYDogs()
                                    }
                                }
                        }
                    }
                }
                .listStyle(.plain)
                .task {
                    await vm.fetchDIYDogs()
                }
                .overlay {
                    if vm.isLoading && vm.beers.isEmpty {
                        ProgressView("Bottling beers...")
                    }
                }
                .refreshable {
                    await vm.fetchDIYDogs()
                }
            }.navigationTitle("The Brew Board")
        }
    }
    
}

struct DIYDogsView_Previews: PreviewProvider {
    static var previews: some View {
        DIYDogsView(vm:
                        DIYDogsViewModel(
                            diyDogFetcher: DIYDogsFetcherMock()
                        )
        )
    }
}
