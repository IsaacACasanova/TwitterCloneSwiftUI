//
//  MockSearchTweetsViewModel.swift
//  TwitterCloneAppTests
//
//  Created by Isaac  Casanova on 5/7/20.
//  Copyright © 2020 Isaac  Casanova. All rights reserved.
//

import Combine

class MockSearchTweetsViewModel: SearchTweetsViewModelType {
    @Published var searchText: String = ""
    var searchTextPublished: Published<String> { _searchText }
    var searchTextPublisher: Published<String>.Publisher { $searchText }
    
    @Published var dataSource: [TweetRowViewModel] = []
    var dataSourcePublished: Published<[TweetRowViewModel]> { _dataSource }
    var dataSourcePublisher: Published<[TweetRowViewModel]>.Publisher { $dataSource }
    
    var cache: ImageCache = MockImageCache()
}
