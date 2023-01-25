//
//  DIYDogDetailView.swift
//  TheBrewBoard
//
//  Created by Paolo Baeli on 23/01/23.
//
import SwiftUI

struct DIYDogDetailView: View {
    @State var beer: Beer
    
    var body: some View {
        Text("\(beer.name)")
    }
}

struct DIYDogDetailView_Previews: PreviewProvider {
    static var previews: some View {
        if let beer = Beer.mock.first {
            DIYDogDetailView(beer: beer)
        }
    }    
}
