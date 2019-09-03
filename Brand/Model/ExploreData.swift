//
//  ExploreData.swift
//  Brand
//
//  Created by Eslam Dweeb on 7/11/19.
//  Copyright © 2019 Eslam Dweeb. All rights reserved.
//

import Foundation

struct ExploreData:Codable {
    let recommended:[DetailedConfig]?
    let latest:[DetailedConfig]?
    let popular:[DetailedConfig]?
}
struct SeeAllData:Codable{
    let configs:[DetailedConfig]
    let links:Links
    let meta:Meta
}
