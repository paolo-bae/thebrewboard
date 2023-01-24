//
//  DIYDogsView.swift
//  TheBrewBoard
//
//  Created by Paolo Baeli on 21/01/23.
//

import SwiftUI
import ModalView

struct DIYDogsView: View {
    @State var beers: [Beer] = []
    
    @StateObject var vm: DIYDogsViewModel
    
    var body: some View {
        ModalPresenter {
            List {
                ForEach(beers) { beer in
                    ModalLink(destination: DIYDogDetailView(beer: beer)) {
                        DIYDogRow(beer: beer)
                    }
                }
            }
            //.listStyle(.plain)
            .task {
                await vm.fetchDIYDogs()
            }
            .overlay {
                if vm.isLoading {
                    ProgressView("Bottling beers...")
                }
            }
            .refreshable {
                await vm.fetchDIYDogs()
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
