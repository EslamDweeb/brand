//
//  Address1.swift
//  Brands
//
//  Created by nada dyaa on 2/4/19.
//  Copyright © 2019 Eslam Dweeb. All rights reserved.
//

import Foundation

struct Address: Codable {
    let id : Int
    let country: Country
    let state: State
    let city: String
    let addressName: String
    let detailedAddress: String?
    let personName: String
    let phone : String
    let postalCode: String?
    let lat :Double?
    let lng : Double?
    var main : Bool
    
    func getFullAddressName() ->String{
        if detailedAddress != nil{
            return "\(country.name ?? "")-\(state.name ?? "")-\(city)-\(detailedAddress ?? "")"
        }else{
            return "\(country.name ?? "")-\(state.name ?? "")-\(city)"
        }
    }
    func getAddressName() ->String{
        return addressName
    }
}

extension Address {
    enum CodingKeys: String, CodingKey {
        case id
        case country
        case state
        case city
        case addressName = "address_name"
        case detailedAddress = "detailed_address"
        case personName = "person_name"
        case phone
        case postalCode = "postal_code"
        case lat
        case lng
        case main 
    }
}
