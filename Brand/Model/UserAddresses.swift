//
//  UserAddresses.swift
//  Brands
//
//  Created by nada dyaa on 2/21/19.
//  Copyright © 2019 Eslam Dweeb. All rights reserved.
//

import Foundation

struct UserAddresses: Codable {
    let data: [Address]
   
}
extension UserAddresses {
    enum CodingKeys:String,CodingKey {
        case data = "addresses"
       
    }
}
