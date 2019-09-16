//
//  Date.swift
//  Brands
//
//  Created by nada dyaa on 2/4/19.
//  Copyright © 2019 Eslam Dweeb. All rights reserved.
//

import Foundation

struct Dates:Codable {    
    let date: String
}
struct NewDate:Codable {
    let date: String
    let timezoneType: Int
    let timezone: String
    
    enum CodingKeys: String, CodingKey {
        case date
        case timezoneType = "timezone_type"
        case timezone
    }
    func convertDateFormatter(formate:String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyy-MM-dd HH:mm:ss"//this your string date format
        dateFormatter.timeZone = NSTimeZone(name: "UTC") as TimeZone?
        dateFormatter.locale = Locale(identifier: "your_loc_id")
        let convertedDate = dateFormatter.date(from: date)
        guard dateFormatter.date(from: date) != nil else {
            //            assert(false, "no date from string")
            return ""
        }
        
        dateFormatter.dateFormat = formate///this is what you want to convert format
        dateFormatter.timeZone = NSTimeZone(name: "UTC") as TimeZone?
        let timeStamp = dateFormatter.string(from: convertedDate!)
        return timeStamp
    }
//    func compare(comedate : String) -> String {
//        let dateFormatter = DateFormatter()
//        dateFormatter.dateFormat = "yyy-MM-dd HH:mm:ss"//this your string date format
//        dateFormatter.timeZone = NSTimeZone(name: "UTC") as TimeZone?
//        dateFormatter.locale = Locale(identifier: "your_loc_id")
//        let nowdate = Date()
//        let dateString = dateFormatter.string(from: nowdate)
//        let startDate = dateFormatter.date(from: date)
//        let now = dateFormatter.date(from: dateString)
//        let endDate = dateFormatter.date(from: comedate)
//        if startDate?.compare(now!) == .orderedAscending && now?.compare(endDate!) == .orderedAscending {
//          return "now".localized
//        }
//        else if now?.compare(startDate!) == .orderedAscending
//        {
//           return "eeeeeee".localized
//
//        }else {
//            return "dddddd"
//        }
//
//    }
}
