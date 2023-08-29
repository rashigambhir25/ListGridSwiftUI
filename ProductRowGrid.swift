//
//  ProductRowGrid.swift
//  LIstAndGrid
//
//  Created by Rashi Gambhir on 08/07/22.
//

import SwiftUI

struct ProductRowGrid: View {
    
    var product: Details
    var image = "https://cdn.shopify.com/s/files/1/1338/0845/collections/lippie-pencil_grande.jpg?v=1512588769"
    
    var body: some View {
        VStack(alignment: .center, spacing: 5){
            AsyncImage(url: URL(string: product.image_link ?? ""), scale: 2) { image in
                        image
                          .resizable()
                          .aspectRatio(contentMode: .fill)
                    } placeholder: {
                       AsyncImage(url: URL(string: image))
                    }
                    .frame(width: 100, height: 100, alignment: .leading)
                    .clipShape(Circle())
                    .shadow(radius: 10)
            Text(product.name ?? "")
                .multilineTextAlignment(.center)
            Text(product.brand ?? "")
                .foregroundColor(.blue)
            Text(product.price_sign ?? "" ) + Text(product.price ?? "")
        }
        .frame(minWidth: 150, minHeight: 250)
        .background(.white)
        .cornerRadius(30)
        .compositingGroup()
        .shadow(color: .black, radius: 10)
    }
}

struct ProductRowGrid_Previews: PreviewProvider {
    static var previews: some View {
        ProductRowGrid(product: Details.init(name: "Lippie Pencil", brand: "colourpop", price: "5.0", price_sign: "$", image_link: "https://cdn.shopify.com/s/files/1/1338/0845/collections/lippie-pencil_grande.jpg?v=1512588769")).previewLayout(.fixed(width: 150, height: 250))
    }
}
