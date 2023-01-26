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
            .frame(width: 70, height: 100, alignment: .center)
            
            VStack(alignment: .leading) {
                Text(beer.name)
                    .font(.title2)
                Text(beer.tagline)
                HStack {
                    Text("ABV: " + (NSString(format: "%.1f", beer.abv ?? "") as String))
                    Text("IBU: " + (NSString(format: "%.1f", beer.ibu ?? "") as String))
                }
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

