//
//  ReviewData.swift
//  Brand
//
//  Created by Eslam Dweeb on 7/1/19.
//  Copyright © 2019 Eslam Dweeb. All rights reserved.
//

import Foundation

// MARK: - ReviewData
struct ReviewData: Codable {
    let ratingables: [Ratingable]
}

// MARK: - Ratingable
struct Ratingable: Codable {
    let id: Int
    let model: String
    let objectID: Int
    let objectName: String
    let object: Object
    let subObjectMedia: String?
    let ratingStatusID: Int
    let rejectionReason: String?
    let value: Int
    let review: String
    let pros, cons: String?
    
    enum CodingKeys: String, CodingKey {
        case id, model
        case objectID = "object_id"
        case objectName = "object_name"
        case object
        case subObjectMedia = "sub_object_media"
        case ratingStatusID = "rating_status_id"
        case rejectionReason = "rejection_reason"
        case value, review, pros, cons
    }
}

// MARK: - Object
struct Object: Codable {
    let id: Int
    let slug, name: String
    let brand: Brand
}
