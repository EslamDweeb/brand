//
//  ProductFilterModel.swift
//  Brand
//
//  Created by nada dyaa on 8/6/19.
//  Copyright © 2019 Eslam Dweeb. All rights reserved.
//

import Foundation

struct FilterModel: Codable {
    let brands: [Brandfilter]?
    let origin: [Origin]?
    let colors: [Brandfilter]?
}

// MARK: - Brand
struct Brandfilter: Codable {
    let name, slug: String
}

// MARK: - Origin
struct Origin: Codable {
    let madeIn: String?
    
    enum CodingKeys: String, CodingKey {
        case madeIn = "made_in"
    }
}

// MARK: - Encode/decode helpers


