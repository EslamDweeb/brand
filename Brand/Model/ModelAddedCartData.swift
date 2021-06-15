//
//  ModelAddedCartData.swift
//  Brand
//
//  Created by iOS on 8/6/19.
//  Copyright © 2019 Eslam Dweeb. All rights reserved.
//

import Foundation
struct ModelAddedCartData: Codable {
    let cartItem : CartItem?
    let message : String?
    let errors : [String : [String]]?
    
    enum CodingKeys: String, CodingKey {
        case cartItem = "cart_item"
        case message
        case errors = "errors"
    }
}
