//
//  User.swift
//  Brands
//
//  Created by nada dyaa on 2/4/19.
//  Copyright © 2019 Eslam Dweeb. All rights reserved.
//

import Foundation

struct User: Codable{
    let id: Int?
    let firstname: String?
    let lastname: String?
    let username: String?
    let email: String?
    let phone: String?
    let birthdate: Dates?
    let gender: Int?
    let photo: Media?
    let address: [Address]?
    let type: String?
    let emailVerified: Bool?
    let phoneVerified: Bool?
    let blocked : Bool?
}

extension User {
    enum CodingKeys: String, CodingKey {
        case id
        case firstname
        case lastname
        case username
        case email
        case phone
        case birthdate
        case gender
        case photo
        case address
        case type
        case emailVerified = "email_verified"
        case phoneVerified = "phone_verified"
        case blocked
    }
}
