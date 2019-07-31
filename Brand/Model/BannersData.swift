//
//  BannersData.swift
//  Brands
//
//  Created by Eslam Dweeb on 3/12/19.
//  Copyright © 2019 Eslam Dweeb. All rights reserved.
//

import Foundation

//struct BannersData: Codable{
//    let banners:[Banner]
//}
//
//struct Banner: Codable {
//    let id: Int
//    let name: String
//    let url: String
//    let photos: Photo
//    let appPriority: Int
//    let appVisibility:Bool
//}
//extension Banner {
//    enum CodingKeys:String,CodingKey {
//        case id
//        case name
//        case url
//        case photos
//        case appPriority = "app_priority"
//        case appVisibility = "app_visibility"
//    }
//}

struct BannersData:Codable {
    let banners:[Banner]
}
struct Banner:Codable {
    let id,appPriority: Int
    let name: String
    let url : String?
    let photos:Photo
    let appVisibility:Bool
}
extension BannersData{
    enum CodingKeys:String,CodingKey {
        case banners = "banners"
    }
}
extension Banner {
    enum CodingKeys:String,CodingKey {
        case id,name,url
        case photos = "apps_image"
        case appPriority = "app_priority"
        case appVisibility = "app_visibility"
    }
}
