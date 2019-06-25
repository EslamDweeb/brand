//
//  Categories.swift
//  Brands
//
//  Created by Eslam Dweeb on 3/17/19.
//  Copyright © 2019 Eslam Dweeb. All rights reserved.
//

import Foundation

struct CategoriesData: Codable {
    let categories:[Category]
}

struct Category:Codable {
    let id,rootID,parentID,level,priority:Int
    let slug,name: String
    let photo:Photo
    let isLeaf,visible: Bool
    let childs: [Category]
}

extension Category{
    enum CodingKeys:String,CodingKey {
        case id,level,slug,name,photo,priority,childs,visible
        case rootID = "root_id"
        case parentID = "parent_id"
        case isLeaf = "is_leaf"
    }
}
