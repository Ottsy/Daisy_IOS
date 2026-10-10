//
//  SearchBarView.swift
//  FishStore
//
//  Created by MAY 02 on 10/10/26.
//
import Foundation
import SwiftUI

struct SearchBarView: View {
    @State private var searchText: String = ""
    
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(.gray)
            
            TextField("Find fish, plants, or anything...", text: $searchText)
                .italic()
            
            Image(systemName: "slider.horizontal.3")
                .foregroundColor(.gray)
        }
        .padding(10)
        .background(Color(.systemGray6))
        .cornerRadius(10)
        .padding(.horizontal)
    }
}

#Preview {
    SearchBarView()
}
