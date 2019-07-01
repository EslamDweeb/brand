//
//  Categories.swift
//  Brands
//
//  Created by Eslam Dweeb on 3/17/19.
//  Copyright © 2019 Eslam Dweeb. All rights reserved.
//

import Foundation

struct CategoriesData: Codable {
    let categories: [Category]
    let links: Links
    let meta: Meta
}

//
// To parse values from Alamofire responses:
//
//   Alamofire.request(url).responseCategory { response in
//     if let category = response.result.value {
//       ...
//     }
//   }

// MARK: - Category
struct Category: Codable {
    let id: Int
    let parent: Parent?
    let level, priority: Int
    let slug, name: String
    let photo, icon: Icon?
    let isLeaf, visible: Bool
    let childs: [Category]
    
    enum CodingKeys: String, CodingKey {
        case id, parent, level, priority, slug, name, photo, icon
        case isLeaf = "is_leaf"
        case visible, childs
    }
}

// MARK: - Icon
struct Icon: Codable {
    let id: Int
    let type: Title
    let path: String
    let title: Title
    let iconDescription: String?
    let main: Bool
    
    enum CodingKeys: String, CodingKey {
        case id, type, path, title
        case iconDescription = "description"
        case main
    }
}

enum Title: String, Codable {
    case icon = "icon"
    case photo = "photo"
}

// MARK: - Parent
struct Parent: Codable {
    let slug: String?
}

// MARK: - Links
struct Links: Codable {
    let first, last: String
    let prev: String?
    let next: String
}

// MARK: - Meta
struct Meta: Codable {
    let currentPage, from, lastPage: Int
    let path: String
    let perPage, to, total: Int
    
    enum CodingKeys: String, CodingKey {
        case currentPage = "current_page"
        case from
        case lastPage = "last_page"
        case path
        case perPage = "per_page"
        case to, total
    }
}
