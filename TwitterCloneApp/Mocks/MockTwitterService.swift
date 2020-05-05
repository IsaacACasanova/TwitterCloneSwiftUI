//
//  MockTwitterService.swift
//  TwitterCloneApp
//
//  Created by Isaac  Casanova on 5/4/20.
//  Copyright © 2020 Isaac  Casanova. All rights reserved.
//

import Combine

struct MockTwitterService: TwitterServiceType {
    func tweets(forSearch search: String) -> AnyPublisher<TweetsResponse, TwitterError> {
        Just(.preview)
        .mapError { error in
            .deserialization(description: error.localizedDescription)
        }
        .eraseToAnyPublisher()
    }
}
