//
//  ContentView.swift
//  FishStore
//
//  Created by Daisy on 5/10/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 16) {
                    HomeHeaderView()
                    SearchBarView()
                    BannerView()
                    CategoryRowView()
                    ProductCardView()
                }
            }
            .navigationTitle("Unique Fish Store")
            .navigationBarHidden(true)
        }
    }
}

#Preview {
    ContentView()
}
