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
        case id,product
        case offerName = "offer_name"
        case startDate = "start_date"
        case endDate = "end_date"
        case salePct = "sale_pct"
        case appVisibility = "app_visibility"
        case siteVisibility = "site_visibility"
        case offerImage = "offer_image"
        case soldOut = "sold_out"
    }
    func compare() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyy-MM-dd HH:mm:ss"//this your string date format
        dateFormatter.timeZone = NSTimeZone(name: "UTC") as TimeZone?
        dateFormatter.locale = Locale(identifier: "your_loc_id")
        let nowdate = Date()
        let dateString = dateFormatter.string(from: nowdate)
        
        let startDate = dateFormatter.date(from: self.startDate.date)
        let now = dateFormatter.date(from: dateString)
        let endDate = dateFormatter.date(from: self.endDate.date)
        if startDate?.compare(now!) == .orderedAscending && now?.compare(endDate!) == .orderedAscending {
            return "now".localized
        }
        else if now?.compare(startDate!) == .orderedAscending
        {
            return "soon".localized
            
        }else {
            return ""
        }
        
    }
}
struct FlashOfferHeader:Codable{
    let settings:[Settings]
}
struct Settings:Codable {
    let id: Int
    let type: String
    let value: NewDate?
    let photo:Media
}
