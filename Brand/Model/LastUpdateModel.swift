//
//  LastUpdateModel.swift
//  Brands
//
//  Created by Eslam Dweeb on 3/21/19.
//  Copyright © 2019 Eslam Dweeb. All rights reserved.
//

import Foundation

struct LastUpdate:Codable {
    let banners,brands,categories,countries:String
    let flashOffers:Bool
}
extension LastUpdate{
    enum CodingKeys:String,CodingKey {
        case banners,brands,categories,countries
        case flashOffers = "flash_offers"
    }
}

