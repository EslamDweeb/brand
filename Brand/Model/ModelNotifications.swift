//
//  ModelNotifications.swift
//  Brand
//
//  Created by iOS on 8/19/19.
//  Copyright © 2019 Eslam Dweeb. All rights reserved.
//

import Foundation

struct ModelNotifications: Codable {
    let notifications: [NotificationModel]
    let links: Links
    let meta: Meta
}

// MARK: - Notification
 struct NotificationModel: Codable {
    let id, action, message: String
    let isRead: Bool
    let userEmail: String
//    let object: JSONNull?
    let createdAt: CreatedAt
    
    enum CodingKeys: String, CodingKey {
        case id, action, message
        case isRead = "is_read"
        case userEmail = "user_email"
   //     case object
        case createdAt = "created_at"
    }
}
