//
//  TwitterError.swift
//  TwitterCloneApp
//
//  Created by Isaac  Casanova on 5/3/20.
//  Copyright © 2020 Isaac  Casanova. All rights reserved.
//

import Foundation

enum TwitterError: Error {
    case network(description: String)
    case deserialization(description: String)
}
