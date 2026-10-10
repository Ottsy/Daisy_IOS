//
//  ContentView.swift
//  FishStore
//
//  Created by MAY 02 on 10/10/26.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedTab = 0
    // Dữ liệu mẫu danh mục
    @State private var categories: [ProductCategory] = [
        ProductCategory(name: " Fish", iconName: "Pet"),
            ProductCategory(name: "Aquatic plants", iconName: "plant"),
            ProductCategory(name: "Aquarium accessories", iconName: "aquarium"),
            ProductCategory(name: "Filtration devices", iconName: "device"),
            ProductCategory(name: "Food", iconName: "shrimp"),
            ProductCategory(name: "Medicine", iconName: "medicine"),
            ProductCategory(name: " Shrimp", iconName: "shrimp_c"),
            ProductCategory(name: "Sale off", iconName: "sale")
    ]
    
    // Dữ liệu mẫu sản phẩm
    @State private var products: [Product] = [
        Product(name: "Koi Fish", categoryId: UUID(), price: 500000, imageName: "Koifish", description: "Luxury", stock: 100),
        Product(name: "Nemo Fish", categoryId: UUID(), price: 50000, imageName: "Nemo", description: "Live easily", stock: 30),
        Product(name: "Pufferfish", categoryId: UUID(), price: 350000, imageName: "Pufferfish", description: "Funny fish", stock: 15)
    ]

    var body: some View {
            TabView(selection: $selectedTab) {
                // Tab 1: Home View
                NavigationStack {
                    ScrollView {
                        
                        VStack(spacing: 16) {
                            HomeHeaderView()
                            SearchBarView()
                            BannerView()
                            
                            // 8 Categories in 2 Rows
                            CategoryRowView(categories: categories)
                            
                            // Hot Products
                            VStack(alignment: .leading, spacing: 10) {
                                HStack {
                                    Text("Sản phẩm nổi bật")
                                        .font(.headline)
                                        .bold()
                                    Spacer()
                                    Text("Xem tất cả >")
                                        .font(.subheadline)
                                        .foregroundColor(.teal)
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
                    .toolbar(.hidden, for: .navigationBar)
                }
                .tabItem {
                    Label("Trang chủ", systemImage: "house.fill")
                }
                .tag(0)
                
                // Tab 2: Categories
                Text("Màn hình Danh mục")
                    .tabItem {
                        Label("Danh mục", systemImage: "square.grid.2x2")
                    }
                    .tag(1)
                
                // Tab 3: Favorites
                Text("Màn hình Yêu thích")
                    .tabItem {
                        Label("Yêu thích", systemImage: "heart")
                    }
                    .tag(2)
                
                // Tab 4: Orders
                OrderView() // Uses your OrderView.swift
                    .tabItem {
                        Label("Đơn hàng", systemImage: "doc.plaintext")
                    }
                    .tag(3)
                
                // Tab 5: Account
                Text("Màn hình Tài khoản")
                    .tabItem {
                        Label("Tài khoản", systemImage: "person")
                    }
                    .tag(4)
            }
            .tint(.teal) 
        }
    }
