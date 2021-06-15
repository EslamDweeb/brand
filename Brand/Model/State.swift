//
//  State.swift
//  Brands
//
//  Created by nada dyaa on 2/4/19.
//  Copyright © 2019 Eslam Dweeb. All rights reserved.
//

import Foundation
struct State : Codable{
    let id: Int
    let name: String?
}
extension State {
    enum CodingKeys: String, CodingKey {
        case id
        case name
        
        
    }
}
