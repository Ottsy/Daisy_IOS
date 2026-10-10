//
//  OrderVIew.swift
//  FishStore
//
//  Created by MAY 02 on 10/10/26.
//

import Foundation
import SwiftUI

struct OrderView: View {
    var body: some View {
        NavigationStack {
            VStack(spacing: 16) {
                Image(systemName: "doc.plaintext")
                    .font(.system(size: 60))
                    .foregroundColor(.teal)
                
                Text("Chưa có đơn hàng nào")
                    .font(.headline)
                
                Text("Các đơn hàng của bạn sẽ xuất hiện tại đây.")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            .navigationTitle("Đơn hàng")
        }
    }
}

#Preview {
    OrderView()
}
