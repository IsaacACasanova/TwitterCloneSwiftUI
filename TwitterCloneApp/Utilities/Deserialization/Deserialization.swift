//
//  Deserialization.swift
//  TwitterCloneApp
//
//  Created by Isaac  Casanova on 5/3/20.
//  Copyright © 2020 Isaac  Casanova. All rights reserved.
//

import Combine
import Foundation

func decode<T: Decodable>(_ data: Data) -> AnyPublisher<T, TwitterError> {
    let decoder = JSONDecoder()
    decoder.dateDecodingStrategy = .secondsSince1970
    decoder.keyDecodingStrategy = .convertFromSnakeCase
    
    return Just(data)
    .decode(type: T.self, decoder: decoder)
    .mapError { error in
        .deserialization(description: error.localizedDescription)
    }
    .eraseToAnyPublisher()
}
