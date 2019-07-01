//
//  Constants.swift
//  Brands
//
//  Created by nada dyaa on 2/4/19.
//  Copyright © 2019 Eslam Dweeb. All rights reserved.
//

import Foundation
struct Constants {
    
    struct ProductionServer {
        static let baseURL = "https://brands.solutionplus.net"
    }
    
    struct Defaults {
        static let authToken = "authToken"
        static let googleApiKey = "AIzaSyBElazdOojJGeAMDPToSdKvldKvQhC0wb4"
        static let placeKey = "AIzaSyBCJRovFaMek4CftqjV9EZpcxN1oV8Q_i4"
        static let countries = "counties"
        static let banners = "banners"
        static let flashSale = "flashSale"
        static let lastUpdate = "lastUpdate"
        static let isLogin = "isLogin"
        static let isFirstRun = "isFirstRun"
        static let local = "en"
    }
    
    struct APIParameterKey {
        static let firstName = "firstname"
        static let lastName = "lastname"
        static let email = "email"
        static let phone = "phone"
        static let gender = "gender"
        static let birthDate = "birthdate"
        static let password = "password"
        static let grantType = "grant_type"
        static let clientID = "client_id"
        static let clientSecret = "client_secret"
        static let userName = "username"
        static let method = "_method"
        static let oldPassword = "old_password"
        static let newPassword = "new_password"
        static let countryID = "country_id"
        static let  stateID = "state_id"
        static let city = "city"
        static let addressName = "address_name"
        static let detailedAddress = "detailed_address"
        static let personName = "person_name"
        static let postalCode = "postal_code"
        static let lat = "lat"
        static let lng = "lng"
        static let main = "main"
        static let photo = "photo"
        static let local = "locale"
    }
}
enum RequestMethods: String {
    case delete = "DELETE"
    case put = "PUT"
    
}

enum HTTPHeaderField: String {
    case authentication = "Authorization"
    case contentType = "Content-Type"
    case acceptType = "Accept"
    case acceptEncoding = "Accept-Encoding"
    case locale = "X-locale"
}

enum ContentType: String {
    case json = "application/json"
    case token = "Bearer"
    case  form = "application/x-www-form-urlencoded"
}