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
    let tags: [Tag]?
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
    let brand: Brand?
    let isFlashOffer: Bool
    let mainPhoto: Media?
    let isFavorite: Bool
    let oldPrice, newPrice: Int?
    let min_qty : Int?
    let max_qty : Int?
    let in_cart : Bool?
    
    enum CodingKeys: String, CodingKey {
        case id
        case productID = "product_id"
        case slug, name, gender, sale, price, qty
        case brand = "brand"
        case isFlashOffer = "is_flash_offer"
        case mainPhoto = "main_photo"
        case isFavorite = "is_favorite"
        case oldPrice = "old_price"
        case newPrice = "new_price"
        case min_qty = "min_qty"
        case max_qty = "max_qty"
        case in_cart = "in_cart"
    }
    func ReturnPriceAfterSale(price:Double,sale:Double) ->Double{
        return price - (price * sale)
    }
    func ReturnTotalPriceAfterSale(price:Double,QTY:Double) ->Double{
        return price * QTY
    }
    func ReturnPricepersent(sale:Double) -> String{
        return "\( Double(round(sale * 100) / 100) * 100) %"
    }
}

struct ProductConfigs:Codable {
    let configs:[Config]
    let links:Links
    let meta:Meta
}
