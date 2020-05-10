//
//  TweetRowViewModel.swift
//  TwitterCloneApp
//
//  Created by Isaac  Casanova on 5/3/20.
//  Copyright © 2020 Isaac  Casanova. All rights reserved.
//

import Foundation

protocol TweetRowViewModelType {
    var name: String { get }
    var screenName: String { get }
    var avatarURL: URL { get }
    var content: String { get }
}

struct TweetRowViewModel: TweetRowViewModelType {
    let name: String
    let screenName: String
    let avatarURL: URL
    let content: String
    let createdAt: String
    
    init?(tweet: TweetsResponse.Tweet) {
        guard let avatarURL = URL(string: tweet.user.avatar),
            let dateString = DateFormatterWrapper.shared.convertedDateString(for: tweet.createdAt) else {
            return nil
        }
        
        self.name = tweet.user.name
        self.screenName = "@" + tweet.user.screenName
        self.avatarURL = avatarURL
        self.content = tweet.text
        self.createdAt = dateString
    }
}

extension TweetRowViewModel: Identifiable {
    var id: String {
        return name + screenName + content
    }
}

extension TweetRowViewModel: Equatable { }
