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
        ScrollView {
            VStack(alignment: .leading) {
                Text(beer.name)
                    .font(.system(size: 32, weight: .bold, design: .default))
                HStack {
                    Text("ABV: " + (NSString(format: "%.1f", beer.abv ?? "") as String))
                        .padding(.trailing)
                    Text("IBU: " + (NSString(format: "%.1f", beer.ibu ?? "") as String))
                        .padding(.trailing)
                    if beer.firstBrewed != nil {
                        Text("First brewed: " + (beer.firstBrewed ?? "-"))
                    }
                }
                .padding(.vertical, 5)

                AsyncImage(url: beer.imageURL) { image in
                    image
                    .resizable()
                } placeholder: {
                    ProgressView()
                }
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 350, height: 300, alignment: .center)
                    .padding(10)
                Text(beer.tagline)
                    .font(.system(size: 25, weight: .bold))
                    .padding(.vertical)
                Text("Description ")
                    .font(.system(size: 20, weight: .bold))
                Text(beer.description)
                    .padding(.top, 2)
                if (beer.brewersTips != nil) {
                    Text("Brewer tips")
                        .font(.system(size: 20, weight: .bold))
                        .padding(.top, 20)
                    Text(beer.brewersTips ?? "")
                        .padding(.top, 2)
                }
            }
            .padding(.all)
        }
        
    }
}

struct DIYDogDetailView_Previews: PreviewProvider {
    static var previews: some View {
        if let beer = Beer.mock.first {
            DIYDogDetailView(beer: beer)
        }
    }
}
