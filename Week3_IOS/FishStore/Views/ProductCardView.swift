//
//  ProductCardView.swift
//  FishStore
//
//  Created by MAY 02 on 10/10/26.
//

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
        name: "Koi fish",
        categoryId: UUID(),
        price: 500000,
        imageName: "Koifish",
        description: "Luxury koi fish for your aquarium",
        stock: 50
    )
    
    ProductCardView(product: sampleProduct)
        .padding()
}
