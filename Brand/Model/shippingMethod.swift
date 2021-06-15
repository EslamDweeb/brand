//
//  shippingMethod.swift
//  Brand
//
//  Created by nada dyaa on 7/18/19.
//  Copyright © 2019 Eslam Dweeb. All rights reserved.
//

import Foundation

struct shippingModel: Codable {
    let shippingMethods: [ShippingMethod]
    
    enum CodingKeys: String, CodingKey {
        case shippingMethods = "shipping_methods"
    }
}


struct ShippingMethod: Codable {
    let id: Int
    let name: String
    let country: Country
    let fees, additionalTax: Int
    let isAvailable: Bool
    
    enum CodingKeys: String, CodingKey {
        case id, name, country, fees
        case additionalTax = "additional_tax"
        case isAvailable = "is_available"
    }
}
