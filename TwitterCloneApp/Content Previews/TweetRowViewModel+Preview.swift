//
//  TweetRowViewModel+Preview.swift
//  TwitterCloneApp
//
//  Created by Isaac  Casanova on 5/4/20.
//  Copyright © 2020 Isaac  Casanova. All rights reserved.
//

import Foundation

extension TweetRowViewModel: Previewed {
    static let preview = TweetRowViewModel(with: .preview)
}

private extension TweetRowViewModel {
    init(with tweet: TweetsResponse.Tweet) {
        self.init(tweet: tweet, dateFormatterWrapper: DateFormatterWrapper.shared)!
    }
}
