//
//  searchModel.swift
//  Brand
//
//  Created by nada dyaa on 8/1/19.
//  Copyright © 2019 Eslam Dweeb. All rights reserved.
//

import Foundation
import UIKit

struct searchModel:Codable {
    let configs : [DetailedConfig]?
    let links:Links?
    let meta:Meta?
}
