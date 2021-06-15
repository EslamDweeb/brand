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
    let errors : Errors?
    enum CodingKeys: String, CodingKey {
        case message
        case orderSummary = "order_summary"
        case errors
    }
}

// MARK: - OrderSummary
struct OrderSummary: Codable {
    let cartItems: [CartItems]
    let totalCartItemsPrice: Double
    let shippingMethod : ShippingMethod
    let billingMethod : BillingMethod
    let coupon: Coupon?
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
struct Coupon: Codable {
    let id: Int
    let serial: String
    let amount, minSelectedTotal, maxUsageNumber, currentUsageNumber: Int
    let maxUsagePerUser, userUsageNumber: Int
    let expireDate: ExpireDate?
    let isEnabled, forUsers, forVendors: Bool
    let categories, brands, products: [String]
    
    enum CodingKeys: String, CodingKey {
        case id, serial, amount
        case minSelectedTotal = "min_selected_total"
        case maxUsageNumber = "max_usage_number"
        case currentUsageNumber = "current_usage_number"
        case maxUsagePerUser = "max_usage_per_user"
        case userUsageNumber = "user_usage_number"
        case expireDate = "expire_date"
        case isEnabled = "is_enabled"
        case forUsers = "for_users"
        case forVendors = "for_vendors"
        case categories, brands, products
    }
}
struct ExpireDate: Codable {
    let date: String
    let timezoneType: Int
    let timezone: String
    
    enum CodingKeys: String, CodingKey {
        case date
        case timezoneType = "timezone_type"
        case timezone
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
