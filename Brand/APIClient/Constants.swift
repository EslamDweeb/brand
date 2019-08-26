//
//  Constants.swift
//  Brands
//
//  Created by nada dyaa on 2/4/19.
//  Copyright © 2019 Eslam Dweeb. All rights reserved.
//

import Foundation
struct Constants {
    
    static let providerFacebook = 1
    static let providerTwitter = 2
    
    struct ProductionServer {
        static let baseURL = "https://brands.solutionplus.net"
        //static let baseURL = "https://api.brands.solutionplus.net"
    }
    
    struct Defaults {
        static let authToken = "authToken"
        static let googleApiKey = "AIzaSyBCJRovFaMek4CftqjV9EZpcxN1oV8Q_i4"
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
        static let fb_ios_token = "fb_ios_token"
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
        static let userSocialId = "user_social_id"
        static let socialProviderId  = "social_provider_id"
        static let value  = "value"
        static let review  = "review"
        static let pros  = "pros"
        static let cons  = "cons"
        static let shippingID = "shipping_method_id"
        static let billingID = "billing_method_id"
        static let AddressID = "address_id"
        static let coupon = "coupon_serial"
        static let configID = "config_id"
        static let qty = "qty"
        static let optionIds = "option_ids"
        static let productOptionValueIds = "product_option_value_ids"
        
        
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

import Firebase

var FCMToken = ""
func getFCMToken () {
    InstanceID.instanceID().instanceID { (result, error) in
        if let error = error {
            print("Error fetching remote instance ID: \(error)")
        } else if let result = result {
            print("Remote instance ID token: \(result.token)")
            FCMToken  = result.token
        }
    }
}

