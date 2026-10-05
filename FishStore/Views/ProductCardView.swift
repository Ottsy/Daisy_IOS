//
//  ProductCardView.swift
//  FishStore
//
//  Created by Daisy on 5/10/26.
//

import Foundation
import SwiftUI

struct ProductCardView: View {
    let product: Product
    
    var body: some View {
        VStack(alignment: .leading) {
            ZStack(alignment: .topTrailing) {
                Image(product.imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(height: 100)
                    .clipped()
                Image(systemName: "heart")
                    .padding(8)
                    .background(.white)
                
            }
        }
    }
}
