//
//  SimpleOrderData.swift
//  Brand
//
//  Created by Eslam Dweeb on 7/3/19.
//  Copyright © 2019 Eslam Dweeb. All rights reserved.
//

import Foundation

struct SimpleOrderData: Codable {
    let orders: [SimpleOrder]
//    let links: Links
//    let meta: Meta
}
struct SimpleOrder: Codable {
    let id: Int
    let referenceNumber: String
    let totalPrice: Int
    let status: Statuses
    let createdAt: CreatedAt
    
    enum CodingKeys: String, CodingKey {
        case id
        case referenceNumber = "reference_number"
        case totalPrice = "total_price"
        case status
        case createdAt = "created_at"
    }
}
// MARK: - Statuses
struct Statuses: Codable {
    let id: Int?
    let name: String
    let estimatedDuration: Int?
    let finishedDate, createdAt, updatedAt: CreatedAt?
    
    enum CodingKeys: String, CodingKey {
        case id, name
        case estimatedDuration = "estimated_duration"
        case finishedDate = "finished_date"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
    }
}
