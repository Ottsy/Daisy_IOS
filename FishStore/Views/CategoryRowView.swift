//
//  CategoryRowView.swift
//  FishStore
//
//  Created by Daisy on 5/10/26.
//

import Foundation
import SwiftUI

struct CategoryRowView: View {
    let categories: [ProductCategory]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 16) {
                ForEach(categories) { cat in
                    VStack(spacing: 8) {
                        ZStack {
                            Circle()
                                .fill(Color.blue.opacity(0.1))
                                .frame(width: 54, height: 54)
                            
                            Image(systemName: cat.iconName)
                                .font(.title2)
                                .foregroundColor(.blue)
                        }
                        
                        Text(cat.name)
                            .font(.caption)
                            .lineLimit(1)
                    }
                    .frame(width: 70)
                }
            }
            .padding(.horizontal)
        }
    }
}

#Preview {
    let sampleCategories = [
        ProductCategory(name: "Cá cảnh", iconName: "fish"),
        ProductCategory(name: "Cây thủy sinh", iconName: "leaf"),
        ProductCategory(name: "Phụ kiện bể", iconName: "cube"),
        ProductCategory(name: "Thiết bị lọc", iconName: "drop")
    ]
    CategoryRowView(categories: sampleCategories)
}
