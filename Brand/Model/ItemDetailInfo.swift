//
//  ItemDetailInfo.swift
//  Brand
//
//  Created by Eslam Dweeb on 7/22/19.
//  Copyright © 2019 Eslam Dweeb. All rights reserved.
//

import Foundation

struct ItemDetailInfo:Codable {
    let config:DetailedConfig
}
struct DetailedConfig:Codable {
    let id, productID: Int
    let productSlug, slug: String
    let catalogID: Int
    let catalogName: String
    let catalogPhoto: Media
    let name,madeIn: String
    let configDescription,sku,sellerNotes:String?
    let gender: Int
    let sale: Float
    let price: Float
    let isFlashOffer: Bool
    let qty, minQty, maxQty: Int
    let vendor: Vendor
    let brand: Brand?
    let overallRating, overallRatingCount, modelRatingID: Double?
    let productOptions: [ProductOptions]
    let discounts: [Discount]?
    let mainPhoto: Media?
    let photos: [Media]?
    let video, file: Media?
    let sellTimes: Int
    let isFavorite: Bool
    let tags: [Tag]?
    let configOptions: [ConfigOption]
    let specs: [Spec]?
    let isEligibleForFreeShipping: Bool
    let relatedProducts: [Config]?
    let inCart, canRate: Bool
    
    enum CodingKeys: String, CodingKey {
        case id
        case productID = "product_id"
        case productSlug = "product_slug"
        case slug, sku
        case catalogID = "catalog_id"
        case catalogName = "catalog_name"
        case catalogPhoto = "catalog_photo"
        case name
        case configDescription = "description"
        case sellerNotes = "seller_notes"
        case madeIn = "made_in"
        case gender, sale, price
        case isFlashOffer = "is_flash_offer"
        case qty
        case minQty = "min_qty"
        case maxQty = "max_qty"
        case vendor, brand
        case overallRating = "overall_rating"
        case overallRatingCount = "overall_rating_count"
        case modelRatingID = "model_rating_id"
        case productOptions = "product_options"
        case discounts
        case mainPhoto = "main_photo"
        case photos, video, file
        case sellTimes = "sell_times"
        case isFavorite = "is_favorite"
        case tags
        case configOptions = "config_options"
        case specs
        case isEligibleForFreeShipping = "is_eligible_for_free_shipping"
        case relatedProducts = "related_products"
        case inCart = "in_cart"
        case canRate = "can_rate"
    }
    func ReturnPricepersent(sale:Double) -> String{
        return "\( Double(round(sale * 100) / 100) * 100) %"
    }
}
// MARK: - ConfigOption
struct ConfigOption: Codable {
    let id: Int
    let name: String
    let input: Input
    let values: [ConfigOptionValue]
}

// MARK: - Input
struct Input: Codable {
    let name, type: String
}
// MARK: - ConfigOptionValue
struct ConfigOptionValue: Codable {
    let id: Int
    let value: String
    let available: Bool
//     let selected, available: Bool
}

// MARK: - Discount
struct Discount: Codable {
    let id, minQty: Int
    let pricePct: Double
    
    enum CodingKeys: String, CodingKey {
        case id
        case minQty = "min_qty"
        case pricePct = "price_pct"
    }
}
struct ProductOptions: Codable {
    let id, optionID: Int
    let name, inputType: String
    let values: [ProductOptionValues]?
    let addsPrice: Float
    let isRequired, selected: Bool?
//    let selected: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case optionID = "option_id"
        case name
        case inputType = "input_type"
        case values
        case addsPrice = "adds_price"
        case isRequired = "is_required"
        case selected
    }
}

// MARK: - ProductOptionValue
struct ProductOptionValues: Codable {
    let id: Int
    let value: String?
    let addsPrice: Int
    let selected: Bool?
    
    enum CodingKeys: String, CodingKey {
        case id, value
        case addsPrice = "adds_price"
        case selected
    }
}
//// MARK: - RelatedProduct
//struct RelatedProduct: Codable {
//    let id, productID: Int
//    let slug, name: String
//    let gender: Int
//    let sale: Double
//    let price, qty: Int
//    let brand: Brand
//    let isFlashOffer: Bool
//    let mainPhoto: Media
//    let isFavorite: Bool
//
//    enum CodingKeys: String, CodingKey {
//        case id
//        case productID = "product_id"
//        case slug, name, gender, sale, price, qty, brand
//        case isFlashOffer = "is_flash_offer"
//        case mainPhoto = "main_photo"
//        case isFavorite = "is_favorite"
//    }
//}

// MARK: - Spec
struct Spec: Codable {
    let id: Int
    let specKey: SpecKey
    let value: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case specKey = "spec_key"
        case value
    }
}
// MARK: - SpecKey
struct SpecKey: Codable {
    let id: Int
    let name: String
    let unit: Tag
    let isShownInFilter, isEnabled, isVisible, isCustom: Bool
    
    enum CodingKeys: String, CodingKey {
        case id, name, unit
        case isShownInFilter = "is_shown_in_filter"
        case isEnabled = "is_enabled"
        case isVisible = "is_visible"
        case isCustom = "is_custom"
    }
}

// MARK: - Tag
struct Tag: Codable {
    let id: Int
    let name: String
}
// MARK: - Vendor
struct Vendor: Codable {
    let id: Int
    let name, username: String
    let createdAt, updatedAt: AtedAt
    
    enum CodingKeys: String, CodingKey {
        case id, name, username
        case createdAt = "created_at"
        case updatedAt = "updated_at"
    }
}

// MARK: - AtedAt
struct AtedAt: Codable {
    let date: String
    let timezoneType: Int
    let timezone: String
    
    enum CodingKeys: String, CodingKey {
        case date
        case timezoneType = "timezone_type"
        case timezone
    }
}
