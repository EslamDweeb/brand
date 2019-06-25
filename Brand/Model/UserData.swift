//
//  UserData.swift
//  Brands
//
//  Created by nada dyaa on 2/5/19.
//  Copyright © 2019 Eslam Dweeb. All rights reserved.
//

import Foundation

struct UserData: Codable {
    let user: User?
    let message: String?
    let errors: Errors?
    let accessToken: String?
}
extension UserData {
    enum CodingKeys:String,CodingKey {
        case user
        case accessToken = "access_token"
        case message
        case  errors
    }
}
