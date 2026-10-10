//
//  BannerView.swift
//  FishStore
//
//  Created by Daisy on 5/10/26.
//

import Foundation
import SwiftUI

struct BannerView: View {
    var body: some View {
        ZStack {
            Image("Banner")
                .resizable()
                .scaledToFill()
                .frame(height: 140)
                .clipped()
            VStack(alignment: .leading) {
                Text("HOT DEALS")
                    .font(.caption)
                    .padding(.horizontal, 10)
                    .padding(.vertical, 4)
                    //.background(Color.pink.opacity(0.3))
                    .foregroundColor(Color.white)
                Text("Why not have one fish")
                    .font(.title3)
                    .bold()
                Text("Helps you to find the best fish for your home")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            .padding(.leading, 16)
            .frame(maxWidth: .infinity, alignment: .leading)
            
            
            //Sale off icon
            VStack {
                HStack {
                    Spacer()
                    VStack {
                        Text("SALE OFF TO")
                            .font(.caption2)
                        Text("30%")
                            .font(.headline)
                            .bold()
                        
                    }
                    .padding(8)
                    .background(Color.orange)
                    .foregroundColor(.white)
                    .clipShape(Circle())
                    .padding(.trailing, 16)
                    
                }
                Spacer()
            }
        }
        .frame(height: 140)
        .cornerRadius(16)
        .padding(.horizontal)
    }
}

#Preview {
    BannerView()
}
