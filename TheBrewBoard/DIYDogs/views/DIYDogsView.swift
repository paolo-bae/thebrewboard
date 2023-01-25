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
                .refreshable {
                    await vm.fetchDIYDogs()
                }
            }
            .navigationTitle("The Brew Board")
            .overlay {
                if (vm.isFetching || vm.isLoading) && vm.beers.isEmpty {
                    ProgressView("Bottling beers...")
                }
            }
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
