//
//  SearchTweetsViewModel.swift
//  TwitterCloneApp
//
//  Created by Isaac  Casanova on 5/2/20.
//  Copyright © 2020 Isaac  Casanova. All rights reserved.
//

import Combine
import Foundation

protocol SearchTweetsViewModelType: ObservableObject, Identifiable {
    var searchText: String { get set }
    var searchTextPublished: Published<String> { get }
    var searchTextPublisher: Published<String>.Publisher { get }
    
    var dataSource: [TweetRowViewModel] { get set }
    var dataSourcePublished: Published<[TweetRowViewModel]> { get }
    var dataSourcePublisher: Published<[TweetRowViewModel]>.Publisher { get }
    
    var cache: ImageCache { get }
}

class SearchTweetsViewModel: SearchTweetsViewModelType {
        
    @Published var searchText: String = ""
    var searchTextPublished: Published<String> { _searchText }
    var searchTextPublisher: Published<String>.Publisher { $searchText }
    
    @Published var dataSource: [TweetRowViewModel] = []
    var dataSourcePublished: Published<[TweetRowViewModel]> { _dataSource }
    var dataSourcePublisher: Published<[TweetRowViewModel]>.Publisher { $dataSource }
    
    let cache: ImageCache = TemporaryImageCache()
    
    private let twitterService: TwitterServiceType
    private var disposables = Set<AnyCancellable>()
    
    init(twitterService: TwitterServiceType,
         scheduler: DispatchQueue = DispatchQueue(label: "SearchTweetsViewModel")) {
        self.twitterService = twitterService
        
        $searchText
         .dropFirst(1)
         .debounce(for: .seconds(0.5), scheduler: scheduler)
         .sink(receiveValue: fetchTweetContents(for:))
         .store(in: &disposables)
    }
}

extension SearchTweetsViewModel {
    func fetchTweetContents(for searchText: String) {
        twitterService.tweets(forSearch: searchText)
        .map { response in
            response.statuses.compactMap(TweetRowViewModel.init)
          }
          .receive(on: DispatchQueue.main)
          .sink(
            receiveCompletion: { [weak self] value in
                guard let self = self else { return }
                switch value {
                    case .failure:
                        self.dataSource = []
                    case .finished:
                        break
                }
            },
            receiveValue: { [weak self] response in
                guard let self = self else { return }
                self.dataSource = response
          })
          .store(in: &disposables)
    }
}
