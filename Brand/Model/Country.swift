//
//  Country.swift
//  Brands
//
//  Created by nada dyaa on 2/4/19.
//  Copyright © 2019 Eslam Dweeb. All rights reserved.
//

import Foundation
struct Country :Codable{
    let id :Int
    let name : String?
    let flag : String?
    let code : String
    let states : [State]?
    
}
    extension Country {
        enum CodingKeys: String, CodingKey {
            case id
            case name
            case flag
            case code
            case states = "states"
        }
}
