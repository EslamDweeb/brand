//
//  checkoutmodel.swift
//  Brand
//
//  Created by nada dyaa on 7/25/19.
//  Copyright © 2019 Eslam Dweeb. All rights reserved.
//

import Foundation

struct checkoutModel: Codable {
    let message: String
    let orderSummary: OrderSummary?
    
    enum CodingKeys: String, CodingKey {
        case message
        case orderSummary = "order_summary"
    }
}

// MARK: - OrderSummary
struct OrderSummary: Codable {
    let cartItems: [CartItems]
    let totalCartItemsPrice: Double
    let shippingMethod : ShippingMethod
    let billingMethod : BillingMethod
    let coupon: String?
    let totalPrice: Double
    let address: Address
    
    enum CodingKeys: String, CodingKey {
        case cartItems = "cart_items"
        case totalCartItemsPrice = "total_cart_items_price"
        case shippingMethod = "shipping_method"
        case billingMethod = "billing_method"
        case coupon
        case totalPrice = "total_price"
        case address
    }
}


// MARK: - CartItem
struct CartItems: Codable {
    let id: Int
    let name: String
    let itemOverallPrice, qty, totalQtyPrice: Double?
    
    enum CodingKeys: String, CodingKey {
        case id, name
        case itemOverallPrice = "item_overall_price"
        case qty
        case totalQtyPrice = "total_qty_price"
    }

}
