//
//  ExploreData.swift
//  Brand
//
//  Created by Eslam Dweeb on 7/11/19.
//  Copyright © 2019 Eslam Dweeb. All rights reserved.
//

import Foundation

struct ExploreData:Codable {
    let recommended:[Config]?
    let latest:[Config]?
    let popular:[Config]?
}
struct SeeAllData:Codable{
    let configs:[Config]
    let links:Links
    let meta:Meta
}
