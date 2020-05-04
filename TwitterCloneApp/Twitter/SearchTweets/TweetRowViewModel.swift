//
//  TweetRowViewModel.swift
//  TwitterCloneApp
//
//  Created by Isaac  Casanova on 5/3/20.
//  Copyright © 2020 Isaac  Casanova. All rights reserved.
//

import Foundation

struct TweetRowViewModel {
    let name: String
    let screenName: String
    let avatarURL: String
    let content: String
    
    init(tweet: TweetsResponse.Tweet) {
        self.name = tweet.user.name
        self.screenName = tweet.user.screenName
        self.avatarURL = tweet.user.avatar
        self.content = tweet.text
    }
}

extension TweetRowViewModel: Identifiable {
    var id: String {
        return name + screenName + content
    }
}
