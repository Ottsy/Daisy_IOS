//
//  BannerView.swift
//  FishStore
//
//  Created by MAY 02 on 10/10/26.
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
            // Main banner text content
            VStack(alignment: .leading) {
                Text("HOT DEALS")
                    .font(.caption)
                    .fontWeight(.bold)
                    .padding(.horizontal, 10)
                    .padding(.vertical, 4)
                    .background(Color.blue.opacity(0.3))
                    .foregroundColor(Color.red)
                    .italic()
                Text("Why Not Have One Fish")
                    .font(.title3)
                    .bold()
                    .foregroundColor(Color.white)
            }
            .padding(.leading, 16)
            .padding(.top, 16)
            .frame(maxWidth: .infinity, alignment: .leading)
            
            
            //Sale off icon
            VStack {
                HStack {
                    Spacer() 
                    
                    VStack(spacing: 2) {
                        Text("SALE OFF")
                            .font(.system(size: 8, weight: .bold))
                        Text("90%")
                            .font(.system(size: 13, weight: .bold))
                    }
                    .frame(width: 50, height: 50)
                    .background(Color.blue.opacity(0.85))
                    .foregroundColor(.white)
                    .clipShape(Circle())
                    .padding(.top, 10)
                    .padding(.trailing, 10)
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
