//
//  Product.swift
//  HomWork1-m4
//
//  Created by Sultanbai Almaz on 16/8/23.
//

import Foundation

// MARK: - Welcome
struct Products: Codable {
    let products: [Product]
    let total, skip, limit: Int
}

// MARK: - Product
struct Product: Codable {
    let id: Int
    let title, description: String
    let price: Int
    let discountPercentage, rating: Double
    let stock: Int
    let brand, category: String
    let thumbnail: String
    let images: [String]
}
