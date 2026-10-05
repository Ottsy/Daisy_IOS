//
//  DataModels.swift
//  FishStore
//
//  Created by Daisy on 5/10/26.
//

import Foundation

// 1. Model Sản phẩm (Cá cảnh, phụ kiện,...)
struct Product: Identifiable {
    let id = UUID()
    var name: String
    var categoryId: UUID
    var price: Double
    var imageName: String
    var description: String
    var stock: Int
}

// 2. Model Danh mục sản phẩm (Cá cảnh, Thức ăn, Máy lọc...)
struct ProductCategory: Identifiable {
    let id = UUID()
    var name: String
    var iconName: String
}

// 3. Model Sản phẩm trong Giỏ hàng
struct CartItem: Identifiable {
    let id = UUID()
    var product: Product
    var quantity: Int
}

// 4. Trạng thái đơn hàng
enum OrderStatus: String, CaseIterable {
    case pending = "Chờ xử lý"
    case preparing = "Đang chuẩn bị"
    case shipping = "Đang giao"
    case delivered = "Đã giao"
    case cancelled = "Đã hủy"
}

// 5. Model Đơn hàng
struct Order: Identifiable {
    let id = UUID()
    var customerName: String
    var items: [CartItem]
    var orderDate: Date
    var status: OrderStatus
    var shippingFee: Double
}


