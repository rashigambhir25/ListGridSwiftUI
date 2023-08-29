//
//  ProductRowList.swift
//  LIstAndGrid
//
//  Created by Rashi Gambhir on 07/07/22.
//

import SwiftUI

struct ProductRowList: View {
    
    var product: Details
    var image = "https://cdn.shopify.com/s/files/1/1338/0845/collections/lippie-pencil_grande.jpg?v=1512588769"
    var body: some View {
        HStack (spacing: 20){
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
            VStack(alignment: .leading) {
                Text(product.name ?? "")
                    .multilineTextAlignment(.leading)
                Text(product.brand ?? "")
                    .foregroundColor(.blue)
                Text(product.price_sign ?? "" ) + Text(product.price ?? "")
            }
        }
    }
}

struct ProductRowList_Previews: PreviewProvider {
    static var previews: some View {
        ProductRowList(product: Details.init(name: "Lippie Pencil", brand: "colourpop", price: "5.0", price_sign: "$", image_link: "https://cdn.shopify.com/s/files/1/1338/0845/collections/lippie-pencil_grande.jpg?v=1512588769")).previewLayout(.fixed(width: 300, height: 100))
    }
}
