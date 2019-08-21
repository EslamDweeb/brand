//
//  FlashesData.swift
//  Brand
//
//  Created by Eslam Dweeb on 7/14/19.
//  Copyright © 2019 Eslam Dweeb. All rights reserved.
//

import Foundation
struct FlashData:Codable {
    let flashes:[Flash]
}
struct Flash:Codable {
    let id: Int
    let offerName: String
    let startDate, endDate: NewDate
    let salePct: Double
    let appVisibility, siteVisibility: Bool
    let product: Product
    let offerImage: Photo
    let soldOut:Bool
    
    enum CodingKeys: String, CodingKey {
        case id
        case offerName = "offer_name"
        case startDate = "start_date"
        case endDate = "end_date"
        case salePct = "sale_pct"
        case appVisibility = "app_visibility"
        case siteVisibility = "site_visibility"
        case product
        case offerImage = "offer_image"
        case soldOut = "sold_out"
    }
}
struct FlashOfferHeader:Codable{
    let settings:[Settings]
}
struct Settings:Codable {
    let id: Int
    let type: String
    let value: NewDate
    let photo:Media
}
