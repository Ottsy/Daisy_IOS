//
//  HomeHeaderView.swift
//  FishStore
//
//  Created by MAY 02 on 10/10/26.
//

import SwiftUI

struct HomeHeaderView: View {
    var storeName: String = "Cool Fish For Cool People"
    var subtitle: String = "Where you can find the best fish in the world"
    
    var body: some View {
        HStack {
            // Logo
            Image(systemName: "fish.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 32, height: 32)
                .foregroundColor(.orange.opacity(0.6))
            
            VStack(alignment: .leading, spacing: 2) {
                Text(storeName)
                    .font(.headline)
                    .bold()
                
                Text(subtitle)
                    .font(.caption)
                    .foregroundColor(.gray)
                    .italic()
            }
            
            Spacer()
            
            // Button for anoucement & cart
            HStack(spacing: 12) {
                Button(action: {}) {
                    Image(systemName: "bell")
                        .font(.title3)
                        .foregroundColor(.black)
                }
                
                Button(action: {}) {
                    Image(systemName: "cart")
                        .font(.title3)
                        .foregroundColor(.black)
                }
            }
        }
        .padding(.horizontal)
    }
}

#Preview {
    HomeHeaderView()
}
