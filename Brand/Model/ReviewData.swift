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
    let message:String?
    let errors:String?
}
struct ReviewDataUpdated: Codable {
    let userRating: Ratingable?
    let message:String?
    let errors:String?
    enum CodingKeys: String, CodingKey {
        case errors, message
        case userRating = "user_rating"
    }
}
// MARK: - Ratingable
struct Ratingable: Codable {
    let id: Int
    let model: String?
    let objectID: Int?
    let objectName: String?
    let object: Object?
    let subObjectMedia: Photo?
    let userPhoto:Media?
    let ratingStatusID: Int
    let rejectionReason: String?
    let value: Int
    let review: String
    let userFullName:String?
    let pros, cons: String?
    
    enum CodingKeys: String, CodingKey {
        case id, model
        case objectID = "object_id"
        case objectName = "object_name"
        case object
        case userPhoto = "user_photo"
        case userFullName = "user_fullname"
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
struct OverallRatingData:Codable{
    let overallRating:OverallRating
}
struct OverallRating:Codable {
    let oneStarCount:Int
    let twoStarCount:Int
    let threeStarCount:Int
    let fourStarCount:Int
    let fiveStarCount:Int
    let totalCount:Int
    let avgValue:String
    enum CodingKeys: String, CodingKey {
        case oneStarCount = "one_star_count"
        case twoStarCount = "two_star_count"
        case threeStarCount = "three_star_count"
        case fourStarCount = "four_star_count"
        case fiveStarCount = "five_star_count"
        case avgValue = "avg_value"
        case totalCount = "total_count"
    }
}
