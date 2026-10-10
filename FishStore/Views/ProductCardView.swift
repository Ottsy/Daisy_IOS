//
//  ProductCardView.swift
//  FishStore
//
//  Created by Daisy on 5/10/26.
//

/*import Foundation
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
                    .clipShape(Circle())
                
                Text(product.name)
                    .font(.subheadline)
                    .lineLimit(1)
                Text("\(product.price, specifier: "%.0f")đ")
                    .font(.subheadline)
                    .bold()
                    .foregroundColor(.red)
                
            }
            .frame(width: 120)
            .background(Color.white)
            .cornerRadius(12)
            .shadow(radius: 2)
        }
    }
    
    //Preview with Mock Data
#Preview {
        let sampleProduct = Product(
            name: "Nemo",
            categoryId: UUID(),
            price: 50000,
            imageName: "fish_sample",
            description: "Nemo is a clownfish from the Great Barrier Reef in Australia.",
            stock: 50
        )
        ProductCardView(product: sampleProduct)
            .padding()
}
*/

import SwiftUI

struct ProductCardView: View {
    let product: Product
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            ZStack(alignment: .topTrailing) {
                // Product Image
                Image(product.imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(height: 100)
                    .clipped()
                
                // Favorite Heart Icon
                Image(systemName: "heart")
                    .padding(8)
                    .background(Color.white)
                    .clipShape(Circle())
                    .padding(6)
            }
            
            // Product Name
            Text(product.name)
                .font(.subheadline)
                .lineLimit(1)
            
            // Product Price
            Text("\(product.price, specifier: "%.0f")đ")
                .font(.subheadline)
                .bold()
                .foregroundColor(.red)
        }
        .frame(width: 120)
        .background(Color.white)
        .cornerRadius(12)
        .shadow(radius: 2)
    }
}

// MARK: - Preview with Mock Data
#Preview {
    let sampleProduct = Product(
        name: "Cá Néon Tetra",
        categoryId: UUID(),
        price: 20000,
        imageName: "fish_sample",
        description: "Cá néon đẹp dễ nuôi",
        stock: 50
    )
    
    ProductCardView(product: sampleProduct)
        .padding()
}
