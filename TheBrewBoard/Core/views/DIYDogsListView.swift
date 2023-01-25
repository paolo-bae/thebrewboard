//
//  DIYDogsListView.swift
//  TheBrewBoard
//
//  Created by Paolo Baeli on 24/01/23.
//

import SwiftUI
import ModalView

struct DIYDogsListView<Content, Data>: View
where Content: View,
      Data: RandomAccessCollection,
      Data.Element: AnimalEntity {
    let animals: Data
    
    let footer: Content
    
    init(animals: Data, @ViewBuilder footer: () -> Content) {
        self.animals = animals
        self.footer = footer()
    }
    
    init(animals: Data) where Content == EmptyView {
        self.init(animals: animals) {
            EmptyView()
        }
    }
    
    var body: some View {
        List {
            ForEach(beers) { beer in
                ModalLink(destination: DIYDogDetailView(beer: beer)) {
                    DIYDogRow(beer: beer)
                }
            }
        }
        .listStyle(.plain)
    }
}

struct DIYDogsListView: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct DIYDogsListView_Previews: PreviewProvider {
    static var previews: some View {
        DIYDogsListView()
    }
}
