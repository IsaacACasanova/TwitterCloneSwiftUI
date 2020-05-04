//
//  SearchTweetsViewModel.swift
//  TwitterCloneApp
//
//  Created by Isaac  Casanova on 5/2/20.
//  Copyright © 2020 Isaac  Casanova. All rights reserved.
//

import Combine
import Foundation

class SearchTweetsViewModel: ObservableObject, Identifiable {
    
    @Published var searchText: String = ""
    @Published var dataSource: [TweetRowViewModel] = []
    
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
            response.statuses.map(TweetRowViewModel.init)
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
