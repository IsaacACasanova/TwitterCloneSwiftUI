//
//  TwitterService.swift
//  TwitterCloneApp
//
//  Created by Isaac Casanova on 5/2/20.
//  Copyright © 2020 Isaac  Casanova. All rights reserved.
//

import Combine
import Foundation

protocol TwitterServiceType {
    func tweets(forSearch search: String) -> AnyPublisher<TweetsResponse, TwitterError>
}

class TwitterService {
    private let session: URLSession
    
    init(session: URLSession = .shared) {
        self.session = session
    }
}

// MARK: - TweetServiceType
extension TwitterService: TwitterServiceType {
    func tweets(forSearch search: String) -> AnyPublisher<TweetsResponse, TwitterError> {
        return performRequest(with: buildTweetSearchRequest(with: search))
    }
    
    private func performRequest<T>(with request: URLRequest?)
        -> AnyPublisher<T, TwitterError> where T: Decodable {
        guard let request = request else {
            let error = TwitterError.network(description: "request creation failed")
            return Fail(error: error).eraseToAnyPublisher()
        }
        
        return session.dataTaskPublisher(for: request)
            .mapError { error in
                .network(description: error.localizedDescription)
            }
            .flatMap(maxPublishers: .max(1)) { pair in
                decode(pair.data)
            }
            .eraseToAnyPublisher()
    }
}

// MARK: - Twitter API
private extension TwitterService {
    struct TwitterAPI {
        static let scheme = "https"
        static let host = "api.twitter.com"
        static let path = "/1.1"
        static let accessToken = "AAAAAAAAAAAAAAAAAAAAAJQqEAEAAAAAbU4tHU9QVVddIiosE1vJzJWEXuw%3D25PiS4mcHfJYwzgk63hPZxTtgwh3NefLUO6hDLfySeFbz7f69j"
        static let authorizationHeader = ["Authorization": "Bearer \(accessToken)"]
    }
    
    func buildTweetSearchRequest(with searchQuery: String) -> URLRequest? {
        var components = URLComponents()
        components.scheme = TwitterAPI.scheme
        components.host = TwitterAPI.host
        components.path = TwitterAPI.path + "/search/tweets.json"
        components.queryItems = [
            URLQueryItem(name: "q", value: searchQuery),
            URLQueryItem(name: "lang", value: "en")
        ]
        
        guard let url = components.url else {
            return nil
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = TwitterAPI.authorizationHeader
        return request
    }
}
