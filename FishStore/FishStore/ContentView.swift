//
//  ContentView.swift
//  FishStore
//
//  Created by Daisy on 5/10/26.
//

import SwiftUI

struct ContentView: View {
    // Dữ liệu mẫu danh mục
    @State private var categories: [ProductCategory] = [
        ProductCategory(name: "Cá cảnh", iconName: "fish"),
        ProductCategory(name: "Cây thủy sinh", iconName: "leaf"),
        ProductCategory(name: "Phụ kiện", iconName: "cube"),
        ProductCategory(name: "Thiết bị lọc", iconName: "drop")
    ]
    
    // Dữ liệu mẫu sản phẩm
    @State private var products: [Product] = [
        Product(name: "Cá Néon Tetra", categoryId: UUID(), price: 20000, imageName: "fish_sample", description: "Cá nhỏ đẹp", stock: 100),
        Product(name: "Cây Java Fern", categoryId: UUID(), price: 50000, imageName: "plant_sample", description: "Dễ chăm sóc", stock: 30),
        Product(name: "Cây thuỷ sinh", categoryId: UUID(), price: 350000, imageName: "filter_sample", description: "Decorate", stock: 15)
    ]

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 16) {
                    // 1. Header Cửa hàng
                    HomeHeaderView()
                    
                    // 2. Ô tìm kiếm
                    SearchBarView()
                    
                    // 3. Banner khuyến mãi
                    BannerView()
                    
                    // 4. Danh mục sản phẩm
                    CategoryRowView(categories: categories)
                    
                    // 5. Danh sách sản phẩm nổi bật
                    VStack(alignment: .leading, spacing: 10) {
                        HStack {
                            Text("Sản phẩm nổi bật")
                                .font(.headline)
                                .bold()
                            Spacer()
                            Text("Xem tất cả >")
                                .font(.subheadline)
                                .foregroundColor(.blue)
                        }
                        .padding(.horizontal)
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 12) {
                                ForEach(products) { product in
                                    ProductCardView(product: product)
                                }
                            }
                            .padding(.horizontal)
                        }
                    }
                }
                .padding(.vertical)
            }
            .navigationTitle("Cá Cảnh Xinh")
            .navigationBarHidden(true)
        }
    }
}

#Preview {
    ContentView()
}
