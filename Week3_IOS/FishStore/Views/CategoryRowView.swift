//
//  CategoryRowView.swift
//  FishStore
//
//  Created by MAY 02 on 10/10/26.
//

import SwiftUI

struct CategoryRowView: View {
    let categories: [ProductCategory]
    
  
    let rows = [
        GridItem(.fixed(80)),
        GridItem(.fixed(80))
    ]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHGrid(rows: rows, spacing: 16) {
                ForEach(categories) { cat in
                    VStack(spacing: 6) {
                        // Custom Asset Image
                        Image(cat.iconName) // Uses asset image name from Assets.xcassets
                            .resizable()
                            .scaledToFit()
                            .frame(width: 48, height: 48)
                            .padding(8)
                            .background(Color.blue.opacity(0.08))
                            .cornerRadius(12)
                        
                        Text(cat.name)
                            .font(.caption)
                            .multilineTextAlignment(.center)
                            .lineLimit(2)
                            .foregroundColor(.primary)
                            .frame(height: 28, alignment: .top)
                    }
                    .frame(width: 72)
                }
            }
            .padding(.horizontal)
        }
    }
}

