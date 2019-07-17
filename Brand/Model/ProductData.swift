//
//  ProductData.swift
//  Brand
//
//  Created by Eslam Dweeb on 7/7/19.
//  Copyright © 2019 Eslam Dweeb. All rights reserved.
//

import Foundation

struct ProductData: Codable {
    let products: [Product]
    let links: Links
    let meta: Meta
}
struct Product: Codable {
    let id: Int
    let slug: String
    let sellerNotes: String?
    let configs: [Config]?
    let tags: [String]?
    let appVisibility, siteVisibility, flashOffer, eligibleForFreeShipping: Bool
    let configurable: Bool
    let video, file: String?
    
    enum CodingKeys: String, CodingKey {
        case id, slug
        case sellerNotes = "seller_notes"
        case configs, tags
        case appVisibility = "app_visibility"
        case siteVisibility = "site_visibility"
        case flashOffer = "flash_offer"
        case eligibleForFreeShipping = "eligible_for_free_shipping"
        case configurable, video, file
    }
}
struct Config: Codable {
    let id, productID: Int
    let slug: String
    let name: String?
    let gender: Int
    let sale: Double
    let price, qty: Int
    let brandName: String?
    let isFlashOffer: Bool
    let mainPhoto: Photo?
    let isFavorite: Bool
    let oldPrice, newPrice: Int?
    
    enum CodingKeys: String, CodingKey {
        case id
        case productID = "product_id"
        case slug, name, gender, sale, price, qty
        case brandName = "brand_name"
        case isFlashOffer = "is_flash_offer"
        case mainPhoto = "main_photo"
        case isFavorite = "is_favorite"
        case oldPrice = "old_price"
        case newPrice = "new_price"
    }
    func ReturnPriceAfterSale(price:Double,sale:Double) ->Double{
        return price - (price * sale)
    }
}

struct ProductConfigs:Codable {
    let configs:[Config]
}