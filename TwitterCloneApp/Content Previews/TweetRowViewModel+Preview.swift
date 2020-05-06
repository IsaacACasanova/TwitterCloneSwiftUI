//
//  TweetRowViewModel+Preview.swift
//  TwitterCloneApp
//
//  Created by Isaac  Casanova on 5/4/20.
//  Copyright © 2020 Isaac  Casanova. All rights reserved.
//

import Foundation

extension TweetRowViewModel {
    static let preview = TweetRowViewModel(with: .preview)
}

private extension TweetRowViewModel {
    init(with tweet: TweetsResponse.Tweet) {
        self.name = tweet.user.name
        self.screenName = "@" + tweet.user.screenName
        self.avatarURL = URL(string: tweet.user.avatar)!
        self.content = tweet.text
    }
}
