//
//  CartModel.swift
//  Brands
//
//  Created by Nada Dyaa on 3/6/19.
//  Copyright © 2019 Eslam Dweeb. All rights reserved.
//

import UIKit

// MARK: - CartData
struct CartData: Codable {
    let cartItems: [CartItem]
    let links: Links
    let meta: Meta?
    
    enum CodingKeys: String, CodingKey {
        case cartItems = "cart_items"
        case links, meta
    }
}
// MARK: - CartItem
struct CartItem: Codable {
    let id: Int
    let config: Config
    let sellerNotes: String?
    let qty: Int
    let options: [Option]
    let itemOverallPrice, totalCartItemsPrice: Double
    
    enum CodingKeys: String, CodingKey {
        case id, config
        case sellerNotes = "seller_notes"
        case qty, options
        case itemOverallPrice = "item_overall_price"
        case totalCartItemsPrice = "total_cart_items_price"
    }
}
// MARK: - Option
struct Option: Codable {
    let id, optionID: Int
    let inputType: String
    let addsPrice: Int
    let productOptionValue: ProductOptionValue?
    
    enum CodingKeys: String, CodingKey {
        case id
        case optionID = "option_id"
        case inputType = "input_type"
        case addsPrice = "adds_price"
        case productOptionValue = "product_option_value"
    }
}
struct ProductOptionValue: Codable {
    let id: Int
    let value: String
    let addsPrice: Int
    
    enum CodingKeys: String, CodingKey {
        case id, value
        case addsPrice = "adds_price"
    }
}
