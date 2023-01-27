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
                    Text("ABV:")
                        .font(.system(size: 15, weight: .bold))
                    Text((NSString(format: "%.1f", beer.abv ?? "") as String))
                        .font(.system(size: 15))
                    Text("IBU:")
                        .font(.system(size: 15, weight: .bold))
                    Text((NSString(format: "%.1f", beer.ibu ?? "") as String))
                        .font(.system(size: 15))
                    if beer.firstBrewed != nil {
                        Text("First brewed:")
                            .font(.system(size: 15, weight: .bold))
                        Text(beer.firstBrewed ?? "-")
                            .font(.system(size: 15))
                    }
                }
            }
            .padding(.vertical)
            .padding(.horizontal, 3)
            
            AsyncImage(url: beer.imageURL) { image in
                image
                    .resizable()
            } placeholder: {
                ProgressView()
            }
            .aspectRatio(contentMode: .fit)
            .frame(width: 300, height: 300, alignment: .center)
            .padding(5)
            
            VStack(alignment: .leading) {
                
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
                
                if(beer.contributedBy != nil) {
                    HStack {
                        Text("Contributed by: ")
                            .fontWeight(.bold)
                        Text(beer.contributedBy ?? "")
                            .padding(.top, 2)
                    }
                }
            }
            .padding(.all)
        }
    }
    
    struct DIYDogDetailView_Previews: PreviewProvider {
        static var previews: some View {
            if let beer = Beer.mock.first {
                DIYDogDetailView(beer: beer)
            }
        }
    }
}
