//
//  MockSearchTweetsViewModel.swift
//  TwitterCloneAppTests
//
//  Created by Isaac  Casanova on 5/7/20.
//  Copyright © 2020 Isaac  Casanova. All rights reserved.
//

import Combine
import Foundation

class MockSearchTweetsViewModel: SearchTweetsViewModel {
    override init(twitterService: TwitterServiceType = MockTwitterService(),
                  cache: ImageCache = TemporaryImageCache(),
                  scheduler: DispatchQueue = .main) {
        super.init(
            twitterService: twitterService,
            cache: cache,
            scheduler: scheduler
        )
    }
}
