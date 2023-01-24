//
//  DIYDogRow.swift
//  TheBrewBoard
//
//  Created by Paolo Baeli on 21/01/23.
//

import SwiftUI

struct DIYDogRow: View {
    let beer: Beer
    
    var body: some View {
        HStack {
            AsyncImage(url: beer.imageURL) { image in
                image
                    .resizable()
            } placeholder: {
                ProgressView()
            }
            .aspectRatio(contentMode: .fit)
            .frame(width: 100, height: 100)
            
            VStack(alignment: .leading) {
                Text(beer.name)
                    .multilineTextAlignment(.center)
                    .font(.title3)
            }
            .lineLimit(1)
        }
    }
}

struct DIYDogRow_Previews: PreviewProvider {
    static var previews: some View {
        if let beer = Beer.mock.first {
            DIYDogRow(beer: beer)
        }
    }
}

