//
//  MockTwitterService.swift
//  TwitterCloneApp
//
//  Created by Isaac  Casanova on 5/4/20.
//  Copyright © 2020 Isaac  Casanova. All rights reserved.
//

import Combine

struct MockTwitterService: TwitterServiceType {
    
    private let success: Bool
    
    init(success: Bool = true) {
        self.success = success
    }
   
    func tweets(forSearch search: String) -> AnyPublisher<TweetsResponse, TwitterError> {
        
        guard success else {
            return Fail(error: TwitterError.network(description: "Networking Error!"))
            .eraseToAnyPublisher()
        }
        
        return Just(.preview)
            .mapError { error in
                .deserialization(description: error.localizedDescription)
            }
            .eraseToAnyPublisher()
    }
}
