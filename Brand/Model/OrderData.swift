//
//  OrderTestModel.swift
//  Brands
//
//  Created by Eslam Dweeb on 2/26/19.
//  Copyright © 2019 Eslam Dweeb. All rights reserved.
//

import Foundation
// MARK: - OrderData
struct OrderData: Codable {
    let order: Order
}
// MARK: - Order
struct Order: Codable {
    let id: Int
    let referenceNumber: String
    let userID: Int?
    let shippingMethod, billingMethod: IngMethod?
    let address: Address?
    let coupon: String?
    let totalPrice: Double
    let items: [Item]?
    let statuses: [Status]
    let createdAt: CreatedAt
    
    enum CodingKeys: String, CodingKey {
        case id
        case referenceNumber = "reference_number"
        case userID = "user_id"
        case shippingMethod = "shipping_method"
        case billingMethod = "billing_method"
        case address, coupon
        case totalPrice = "total_price"
        case items, statuses
        case createdAt = "created_at"
    }
}

// MARK: - IngMethod
struct IngMethod: Codable {
    let id: Int
    let name: String
    let isAvailable: Bool
    let fees, additionalTax: Int
    let country: Country?
    
    enum CodingKeys: String, CodingKey {
        case id, name
        case isAvailable = "is_available"
        case fees
        case additionalTax = "additional_tax"
        case country
    }
}

// MARK: - CreatedAt
struct CreatedAt: Codable {
    let date: String
    let timezoneType: Int
    let timezone: String
    
    enum CodingKeys: String, CodingKey {
        case date
        case timezoneType = "timezone_type"
        case timezone
    }
}
// MARK: - Item
struct Item: Codable {
    let id, orderID, configID: Int
    let name: String
    let unitPrice, unitOverallPrice, qty: Int
    
    enum CodingKeys: String, CodingKey {
        case id
        case orderID = "order_id"
        case configID = "config_id"
        case name
        case unitPrice = "unit_price"
        case unitOverallPrice = "unit_overall_price"
        case qty
    }
}

// MARK: - Status
struct Status: Codable {
    let id: Int
    let name: String
    let estimatedDuration: Int
    let finishedDate, createdAt, updatedAt: CreatedAt
    
    enum CodingKeys: String, CodingKey {
        case id, name
        case estimatedDuration = "estimated_duration"
        case finishedDate = "finished_date"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
    }
}
