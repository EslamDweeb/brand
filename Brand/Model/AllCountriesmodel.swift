//
//  AllCountries.swift
//  Brands
//
//  Created by Nada Dyaa on 2/27/19.
//  Copyright © 2019 Eslam Dweeb. All rights reserved.
//

import Foundation

struct AllCountriesmodel : Codable {
    let data: [Country]
    
}
extension AllCountriesmodel  {
    enum CodingKeys:String,CodingKey {
        case data = "countries"
        
    }
}
