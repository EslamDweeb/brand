//
//  UploadPhotoInfo.swift
//  Brands
//
//  Created by Eslam Dweeb on 2/11/19.
//  Copyright © 2019 Eslam Dweeb. All rights reserved.
//

import Foundation

struct UploadPhotoInfo: Codable {
    let photo : Photo?
    let message: String
}

struct Photo: Codable {
    let id: Int
    let type: String
    let path: String
    let title: String?
    let description: String?
    let main: Bool
}
