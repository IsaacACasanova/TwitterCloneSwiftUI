//
//  Tweet+Preview.swift
//  TwitterCloneApp
//
//  Created by Isaac  Casanova on 5/4/20.
//  Copyright © 2020 Isaac  Casanova. All rights reserved.
//

import Foundation

extension TweetsResponse.Tweet {
    static let preview = TweetsResponse.Tweet(
        text: "This is the content of my tweet",
        user: .preview
    )
}

extension TweetsResponse.Tweet.User {
    static let preview = TweetsResponse.Tweet.User(
        name: "Test User Name",
        screenName: "UserScreenName",
        avatar: "https://www.google.com"
    )
}
