
//
//  BillingMethod.swift
//  Brand
//
//  Created by nada dyaa on 7/24/19.
//  Copyright © 2019 Eslam Dweeb. All rights reserved.
//

import Foundation

struct billingModel: Codable {
    let billingMethods: [BillingMethod]
    
    enum CodingKeys: String, CodingKey {
        case billingMethods = "billing_methods"
    }
}


struct BillingMethod: Codable {
    let id: Int
    let name: String
    let fees, additionalTax: Int
    let isAvailable: Bool
    
    enum CodingKeys: String, CodingKey {
        case id, name, fees
        case additionalTax = "additional_tax"
        case isAvailable = "is_available"
    }
}
