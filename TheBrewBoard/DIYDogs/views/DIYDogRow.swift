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
                    .font(.system(size: 20, weight: .bold))
                Text(beer.tagline)
                    .padding(.top, 1)
                HStack {
                    Text("ABV:")
                        .font(.system(size: 15, weight: .bold))
                    Text((NSString(format: "%.1f", beer.abv ?? "") as String))
                        .font(.system(size: 15))
                }
                .padding(.top, 0.3)
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

