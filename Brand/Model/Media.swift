//
//  Media.swift
//  Brands
//
//  Created by nada dyaa on 2/4/19.
//  Copyright © 2019 Eslam Dweeb. All rights reserved.
//

import Foundation

struct Media : Codable {
    let id : Int
    let path : String
    let type : String
    let title  : String?
    let description :String?
    let main : Bool?
}
extension Media {
    enum CodingKeys: String , CodingKey {
        case id
        case path
        case type
        case title
        case description
        case main = "main"
        
    }
}
