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
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct DIYDogDetailView_Previews: PreviewProvider {
    static var previews: some View {
        if let beer = Beer.mock.first {
            DIYDogDetailView(beer: beer)
        }
    }    
}
