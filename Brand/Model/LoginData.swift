//
//  LoginData.swift
//  Brands
//
//  Created by nada dyaa on 2/6/19.
//  Copyright © 2019 Eslam Dweeb. All rights reserved.
//

import Foundation

struct LoginData: Codable {
    let accessToken: String?
    let message: String?
}

extension LoginData {
    enum CodingKeys:String,CodingKey {
        case accessToken = "access_token"
        case message
   }
}
