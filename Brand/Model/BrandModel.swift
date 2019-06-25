//
//  BrandModel.swift
//  Brands
//
//  Created by Eslam Dweeb on 3/11/19.
//  Copyright © 2019 Eslam Dweeb. All rights reserved.
//

import Foundation

struct BrandData:Codable {
    let brands:[Brand]
}
struct Brand:Codable {
    let id,priority: Int
    let name,slug: String
    let logoImage,headerImage: Photo
}

extension Brand {
    enum CodingKeys:String,CodingKey {
        case id,slug,name,priority
        case logoImage = "logo_image"
        case headerImage = "header_image"
    }
}
