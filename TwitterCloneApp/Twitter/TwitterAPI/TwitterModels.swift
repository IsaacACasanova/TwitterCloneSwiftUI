//
//  TwitterModels.swift
//  TwitterCloneApp
//
//  Created by Isaac  Casanova on 5/3/20.
//  Copyright © 2020 Isaac  Casanova. All rights reserved.
//

import Foundation

struct TweetsResponse: Codable {
    let statuses: [Tweet]
    
    struct Tweet: Codable {
        let createdAt: String
        let text: String
        let user: User

        struct User: Codable {
            let name: String
            let screenName: String
            let avatar: String
            
            enum CodingKeys: String, CodingKey {
                case name
                case screenName
                case avatar = "profileImageUrlHttps"
            }
        }
    }
}
